import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/repositories/history/history_repository.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_repository.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:result_dart/result_dart.dart';

const int maxVisibleItems = 10;
const int maxHydrationAttempts = 3;

class _HydrationState {
  bool isHydrating = false;
  bool isCompleted = false;
}

class HistoryViewModel extends ChangeNotifier {
  final HistoryRepository _historyRepository;
  final UrlConversionRepository _urlConversionRepository;
  final _log = Logger('HistoryViewModel');

  late Command<void, Result<List<Conversion>>> loadHistoryCommand;
  late Command<void, void> showMoreCommand;
  late Command<int, bool> toggleItemSelectedStateCommand;
  late Command<void, void> deleteSelectedItemsCommand;
  late Command<void, void> clearSelectionCommand;

  int _visibleItemsCount = 0;
  List<Conversion> _conversions = [];
  HashSet<String> _selectedItemKeys = HashSet();
  final Map<String, _HydrationState> _hydrationStates = {};

  int _lastDeletedIndex = -1;
  List<Conversion> _lastDeletedItems = [];
  bool _pendingUndo = false;
  late Command<void, void> selectAllCommand;

  final TextEditingController searchController = TextEditingController();
  Timer? _searchDebounce;
  bool _isSearchActive = false;
  List<Conversion> _searchResults = [];

  bool _showFavoritesOnly = false;
  String? _lastPinnedUrl;
  Set<String>? _exitingItemKeys;

  List<Conversion> get _displayConversions {
    var list = _isSearchActive ? _searchResults : _conversions;

    if (_showFavoritesOnly) {
      list = list.where((c) => c.isFavorite).toList();
    }

    list = List.of(list)..sort((a, b) {
      if (a.isFavorite == b.isFavorite) return 0;
      return a.isFavorite ? -1 : 1;
    });

    return list;
  }

  int get visibleItemsCount {
    final display = _displayConversions;
    return min(_visibleItemsCount, display.length);
  }

  bool get hiddenItems => _visibleItemsCount < _displayConversions.length;
  bool get isSelectingMode => _selectedItemKeys.isNotEmpty;
  int get selectedCount => _selectedItemKeys.length;
  bool get isShowingFavoritesOnly => _showFavoritesOnly;
  bool get hasFavorites => _conversions.any((c) => c.isFavorite);

  bool get isAllSelected {
    if (_displayConversions.isEmpty) return false;
    return _selectedItemKeys.length == _displayConversions.length;
  }

  bool get hasPendingUndo => _pendingUndo;
  String? get lastPinnedUrl => _lastPinnedUrl;

  bool isFavorite(String url) {
    final index = _conversions.indexWhere((c) => c.url.toString() == url);
    if (index == -1) return false;
    return _conversions[index].isFavorite;
  }

  void clearPinnedFlag() {
    _lastPinnedUrl = null;
  }

  Set<String>? get exitingItemKeys => _exitingItemKeys;
  int get lastDeletedCount => _lastDeletedItems.length;
  Conversion conversionAt(int index) => _displayConversions[index];

  HistoryViewModel({
    required HistoryRepository historyRepository,
    required UrlConversionRepository urlConversionRepository,
  }) : _historyRepository = historyRepository,
       _urlConversionRepository = urlConversionRepository {
    loadHistoryCommand = Command.createAsyncNoParam<Result<List<Conversion>>>(
      _getConversionHistory,
      initialValue: Success([]),
    );
    showMoreCommand = Command.createSyncNoParamNoResult(_showMore);
    toggleItemSelectedStateCommand = Command.createSync<int, bool>(
      _toggleItemSelectedState,
      initialValue: false,
    );
    deleteSelectedItemsCommand = Command.createAsyncNoParamNoResult(
      _deleteSelectedItems,
    );
    clearSelectionCommand = Command.createSyncNoParamNoResult(_clearSelection);
    selectAllCommand = Command.createSyncNoParamNoResult(_selectAll);

    searchController.addListener(_onSearchChanged);
    loadHistoryCommand.execute();
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    _searchDebounce?.cancel();
    super.dispose();
  }

  bool isHydrating(int index) {
    final display = _displayConversions;
    if (index < 0 || index >= display.length) return false;
    final key = display[index].url.toString();
    return _hydrationStates[key]?.isHydrating ?? false;
  }

  bool isSelected(int index) {
    final display = _displayConversions;
    if (index < 0 || index >= display.length) return false;
    return _selectedItemKeys.contains(display[index].url.toString());
  }

  Future<Result<List<Conversion>>> _getConversionHistory() async {
    var result = await _historyRepository.getConversionHistory();

    return result.fold(
      (data) {
        _log.info("Conversion history retrieved successfully");

        data = data.reversed.toList();

        _visibleItemsCount = min(data.length, maxVisibleItems);
        _isSearchActive = false;
        _searchResults = [];

        _selectedItemKeys = HashSet<String>();
        _conversions = data;
        _hydrationStates.clear();
        _hydratePendingConversions();

        return Success(data);
      },
      (error) {
        _log.severe("Failed to retrieve conversion history", error);
        return Failure(error);
      },
    );
  }

  void _hydratePendingConversions() {
    for (var conversion in _conversions) {
      final key = conversion.url.toString();
      final state = _hydrationStates[key];

      if (conversion.mapImagePath != null) {
        _hydrationStates[key] = _HydrationState()..isCompleted = true;
        continue;
      }

      if (state != null &&
          (state.isCompleted || state.isHydrating || conversion.enrichmentAttempts >= maxHydrationAttempts)) {
        continue;
      }

      final newState = _HydrationState()..isHydrating = true;
      _hydrationStates[key] = newState;
      _hydrateConversion(conversion, key);
    }
  }

  Future<void> _hydrateConversion(Conversion conversion, String key) async {
    var result = await _urlConversionRepository.hydrateConversion(conversion);

    result.fold(
      (hydrated) {
        final state = _hydrationStates[key];
        if (state != null) {
          state.isHydrating = false;
          state.isCompleted = true;
        }

        final index = _conversions.indexWhere((c) => c.url.toString() == key);
        if (index != -1) {
          _conversions[index] = hydrated;
        }

        notifyListeners();
      },
      (error) {
        _log.warning("Hydration failed: $error");
        final state = _hydrationStates[key];

        final updatedConversion = conversion.copyWith(
          enrichmentAttempts: conversion.enrichmentAttempts + 1,
        );

        _historyRepository.updateConversion(updatedConversion);

        final index = _conversions.indexWhere((c) => c.url.toString() == key);
        if (index != -1) {
          _conversions[index] = updatedConversion;
        }

        if (state != null) {
          state.isHydrating = false;
          if (updatedConversion.enrichmentAttempts >= maxHydrationAttempts) {
            state.isCompleted = true;
          }
        }

        notifyListeners();
      },
    );
  }

  void _showMore() {
    final display = _displayConversions;
    if (_visibleItemsCount < display.length) {
      _visibleItemsCount = min(
        _visibleItemsCount + maxVisibleItems,
        display.length,
      );
      notifyListeners();
    }
  }

  bool _toggleItemSelectedState(int index) {
    final display = _displayConversions;
    if (index < 0 || index >= display.length) return false;
    final key = display[index].url.toString();

    if (_selectedItemKeys.contains(key)) {
      _selectedItemKeys.remove(key);
    } else {
      _selectedItemKeys.add(key);
    }

    notifyListeners();
    return isSelected(index);
  }

  void _clearSelection() {
    _selectedItemKeys = HashSet<String>();
    notifyListeners();
  }

  void _selectAll() {
    final display = _displayConversions;
    if (isAllSelected) {
      _selectedItemKeys = HashSet<String>();
    } else {
      _selectedItemKeys = HashSet.of(display.map((c) => c.url.toString()));
    }
    notifyListeners();
  }

  void deleteSingleConversion(int index) {
    final display = _displayConversions;
    if (index < 0 || index >= display.length) return;

    final item = display[index];
    _lastDeletedItems = [item];
    _lastDeletedIndex = _conversions.indexWhere(
      (c) => c.url.toString() == item.url.toString(),
    );

    _conversions.removeAt(_lastDeletedIndex);
    if (_visibleItemsCount > _conversions.length) {
      _visibleItemsCount = _conversions.length;
    }

    _historyRepository.deleteConversion(item).then((r) {
      r.onFailure((e) {
        _log.warning("Failed to delete conversion: $e");
        loadHistoryCommand.execute();
      });
    });
    _pendingUndo = true;
    notifyListeners();
  }

  void clearUndoFlag() {
    _pendingUndo = false;
  }

  void undoLastDeletion() {
    if (_lastDeletedItems.isEmpty) return;

    for (final item in _lastDeletedItems.reversed) {
      final originalIndex = _conversions.indexWhere(
        (c) => c.url.toString().compareTo(item.url.toString()) > 0,
      );
      final insertAt = originalIndex != -1 ? originalIndex : _conversions.length;
      _conversions.insert(insertAt, item);
      _historyRepository.saveConversion(item).then((r) {
        r.onFailure((e) => _log.warning("Failed to save conversion: $e"));
      });
    }

    _visibleItemsCount = _displayConversions.length;
    _lastDeletedItems = [];
    _lastDeletedIndex = -1;
    notifyListeners();
  }

  Future _deleteSelectedItems() async {
    if (!isSelectingMode) {
      return;
    }

    final display = _displayConversions;
    _lastDeletedItems = display
        .where((c) => _selectedItemKeys.contains(c.url.toString()))
        .toList();

    _exitingItemKeys = _lastDeletedItems.map((c) => c.url.toString()).toSet();
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 300));

    final toDelete = _conversions
        .where((c) => _selectedItemKeys.contains(c.url.toString()))
        .toList();

    await Future.wait(
      toDelete.map((c) => _historyRepository.deleteConversion(c)),
    );

    _selectedItemKeys = HashSet<String>();
    _exitingItemKeys = null;
    _pendingUndo = true;
    loadHistoryCommand.execute();
    notifyListeners();
  }

  void _onSearchChanged() {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      _performSearch(searchController.text);
    });
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      _isSearchActive = false;
      _searchResults = [];
    } else {
      _isSearchActive = true;
      final q = query.toLowerCase();
      _searchResults = _conversions.where((c) {
        return (c.addressLine1?.toLowerCase().contains(q) ?? false) ||
            (c.addressLine2?.toLowerCase().contains(q) ?? false) ||
            (c.formattedAddress?.toLowerCase().contains(q) ?? false);
      }).toList();
    }
    _visibleItemsCount = min(
      _displayConversions.length,
      maxVisibleItems,
    );
    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();
    _isSearchActive = false;
    _searchResults = [];
    _visibleItemsCount = min(_displayConversions.length, maxVisibleItems);
    notifyListeners();
  }

  void toggleShowFavoritesOnly() {
    _showFavoritesOnly = !_showFavoritesOnly;
    _visibleItemsCount = min(
      _displayConversions.length,
      maxVisibleItems,
    );
    notifyListeners();
  }

  Future<void> toggleFavorite(Conversion conversion) async {
    final updated = conversion.copyWith(isFavorite: !conversion.isFavorite);

    final index = _conversions.indexWhere(
      (c) => c.url.toString() == conversion.url.toString(),
    );
    if (index != -1) {
      _conversions[index] = updated;
    }

    _lastPinnedUrl = conversion.url.toString();
    await _historyRepository.updateConversion(updated);
    notifyListeners();
  }
}
