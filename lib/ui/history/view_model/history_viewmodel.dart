import 'package:flutter/widgets.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion.dart';
import 'package:result_dart/result_dart.dart';

class HistoryViewModel extends ChangeNotifier {
  final UrlConversionRepository _urlConversionRepository;
  final _log = Logger('HistoryViewModel');

  late Command loadHistoryCommand;

  HistoryViewModel({required UrlConversionRepository urlConversionRepository})
    : _urlConversionRepository = urlConversionRepository {
    loadHistoryCommand =
        Command.createAsyncNoParam<Result<List<Conversion>>>(
          _getConversionHistory,
          initialValue: Success([]),
        );

    loadHistoryCommand.execute();
  }

  Future<Result<List<Conversion>>> _getConversionHistory() async {
    var result = await _urlConversionRepository.getConversionHistory();

    return result.fold(
      (data) {
        _log.info("Conversion history retrieved successfully");
        return Success(data);
      },
      (error) {
        _log.severe("Failed to retrieve conversion history", error);
        return Failure(error);
      },
    );
  }
}
