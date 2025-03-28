import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion.dart';
import 'package:result_dart/result_dart.dart';

/// Max number of items to show in the history (or the number of elements to add when "show more" pressed)
const int maxVisibleItems = 10;

class HistoryViewModel extends ChangeNotifier {
  final UrlConversionRepository _urlConversionRepository;
  final _log = Logger('HistoryViewModel');

  late Command loadHistoryCommand;
  late Command showMoreCommand;

  int _visibleItemsCount = 0;
  int get visibleItemsCount => _visibleItemsCount;
  bool _hiddenItems = false;
  bool get hiddenItems => _hiddenItems;
  List<Conversion> _conversions = [];
  List<Conversion> get conversions => _conversions;

  HistoryViewModel({required UrlConversionRepository urlConversionRepository})
    : _urlConversionRepository = urlConversionRepository {
    loadHistoryCommand = Command.createAsyncNoParam<Result>(
      _getConversionHistory,
      initialValue: Success([]),
    );
    showMoreCommand = Command.createSyncNoParamNoResult(_showMore);

    loadHistoryCommand.execute();
  }

  Future<Result> _getConversionHistory() async {
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

        _conversions = data;
        return Success("");
      },
      (error) {
        _log.severe("Failed to retrieve conversion history", error);
        return Failure(error);
      },
    );
  }

  void _showMore() {
    if (_hiddenItems) {
      _visibleItemsCount = min(_visibleItemsCount + maxVisibleItems, _conversions.length);
      if (_visibleItemsCount == _conversions.length) {
        _hiddenItems = false;
      }
      notifyListeners();
    }
  }
}
