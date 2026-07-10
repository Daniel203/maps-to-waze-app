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

  int _visibleItemsCount = 0;
  bool _hiddenItems = false;
  List<Conversion> _conversions = [];
  HashSet<int> _selectedItems = HashSet();
  final Map<String, _HydrationState> _hydrationStates = {};

  int get visibleItemsCount => _visibleItemsCount;
  bool get hiddenItems => _visibleItemsCount < _conversions.length;
  bool get isSelectingMode => _selectedItems.isNotEmpty;

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
      _toogleItemSelectedState,
      initialValue: false,
    );
    deleteSelectedItemsCommand = Command.createAsyncNoParamNoResult(
      _deleteSelectedItems,
    );

    loadHistoryCommand.execute();
  }

  bool isHydrating(int index) {
    if (index < 0 || index >= _conversions.length) return false;
    final key = _conversions[index].url.toString();
    return _hydrationStates[key]?.isHydrating ?? false;
  }

  Future<Result<List<Conversion>>> _getConversionHistory() async {
    var result = await _historyRepository.getConversionHistory();

    return result.fold(
      (data) {
        _log.info("Conversion history retrieved successfully");

        data = data.reversed.toList();

        _visibleItemsCount = min(data.length, maxVisibleItems);
        if (data.length > maxVisibleItems) {
          _hiddenItems = true;
        }

        _selectedItems = HashSet();
        _conversions = data;

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
    if (_hiddenItems) {
      _visibleItemsCount = min(
        _visibleItemsCount + maxVisibleItems,
        _conversions.length,
      );
      if (_visibleItemsCount == _conversions.length) {
        _hiddenItems = false;
      }
      notifyListeners();
    }
  }

  bool _toogleItemSelectedState(int index) {
    if (_selectedItems.contains(index)) {
      _selectedItems.remove(index);
    } else {
      _selectedItems.add(index);
    }

    notifyListeners();
    return isSelected(index);
  }

  bool isSelected(int index) {
    return _selectedItems.contains(index);
  }

  Future _deleteSelectedItems() async {
    if (!isSelectingMode) {
      return;
    }

    for (var index in _selectedItems) {
      if (index < 0 || index >= _conversions.length) {
        continue;
      }
      var conversion = _conversions[index];
      await _historyRepository.deleteConversion(conversion);
    }

    _selectedItems = HashSet<int>();
    loadHistoryCommand.execute();
    notifyListeners();
    return;
  }
}
