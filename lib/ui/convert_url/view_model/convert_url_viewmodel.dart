import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:result_dart/result_dart.dart';

class ConvertUrlViewModel extends ChangeNotifier {
  final UrlConversionRepository _urlConversionRepository;
  final _log = Logger('ConvertUrlViewModel');

  late Command convertUrlCommand;

  ConvertUrlViewModel({
    required UrlConversionRepository urlConversionRepository,
  }) : _urlConversionRepository = urlConversionRepository {
    convertUrlCommand = Command.createAsync<String, Result<Uri>?>(
      _convertUrl,
      initialValue: null,
    );
  }

  Future<Result<Uri>> _convertUrl(String url) async {
    if (url.isEmpty) {
      return Failure(Exception("Url not found"));
    }

    var result = await _urlConversionRepository.convertUrl(url);

    return result.fold(
      (response) {
        _log.info("Url converted successfully");
        return Success(response.url);
      },
      (error) {
        _log.severe("Url conversion failed", error);
        return Failure(error);
      },
    );
  }
}
