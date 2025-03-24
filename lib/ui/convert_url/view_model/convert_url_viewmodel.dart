import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:result_dart/result_dart.dart';

class ConvertUrlViewModel extends ChangeNotifier {
  final UrlConversionRepository _urlConversionRepository;
  final _log = Logger('ConvertUrlViewModel');

  late Command convertUrl;

  ConvertUrlViewModel({
    required UrlConversionRepository urlConversionRepository,
  }) : _urlConversionRepository = urlConversionRepository {
    convertUrl = Command.createAsync<String, Result<Uri>>(
      _convertUrl,
      initialValue: Success(Uri.parse("")),
    );
  }

  Future<Result<Uri>> _convertUrl(String url) async {
    if (url.isEmpty) {
      return Failure(Exception("Url not found"));
    }

    var result = await _getConvertedUrl(url);

    return result.fold(
      (uri) {
        _log.info("Url converted successfully");
        return Success(uri);
      },
      (error) {
        _log.severe("Url conversion failed", error);
        return Failure(error);
      },
    );
  }

  Future<Result<Uri>> _getConvertedUrl(String url) async {
    if (url.isEmpty) {
      return Failure(Exception("Url not found"));
    }

    return await _urlConversionRepository.convertUrl(url);
  }
}
