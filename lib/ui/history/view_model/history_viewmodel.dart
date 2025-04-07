import 'dart:collection';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:result_dart/result_dart.dart';

/// Max number of items to show in the history (or the number of elements to add when "show more" pressed)
const int maxVisibleItems = 10;

class HistoryViewModel extends ChangeNotifier {
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

  int get visibleItemsCount => _visibleItemsCount;
  bool get hiddenItems => _visibleItemsCount < _conversions.length;
  /// When the user long press an item, it will be selected and enters the selecting mode
  bool get isSelectingMode => _selectedItems.isNotEmpty;

  HistoryViewModel({required UrlConversionRepository urlConversionRepository})
    : _urlConversionRepository = urlConversionRepository {
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

  Future<Result<List<Conversion>>> _getConversionHistory() async {
    var result = await _urlConversionRepository.getConversionHistory();

    return result.fold(
      (data) {
        _log.info("Conversion history retrieved successfully");

        // reverse the list to show the latest conversion first
        data = data.reversed.toList();

        _visibleItemsCount = min(data.length, maxVisibleItems);
        if (data.length > maxVisibleItems) {
          _hiddenItems = true;
        }

        _selectedItems = HashSet();
        _conversions = data;
        return Success(data);
      },
      (error) {
        _log.severe("Failed to retrieve conversion history", error);
        return Failure(error);
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
      await _urlConversionRepository.deleteConversion(conversion);
    }

    _selectedItems = HashSet<int>();
    loadHistoryCommand.execute();
    notifyListeners();
    return;
  }
}
