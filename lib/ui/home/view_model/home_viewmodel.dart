import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:result_dart/result_dart.dart';

class HomeViewModel extends ChangeNotifier {
  final UrlConversionRepository _urlConversionRepository;
  final _log = Logger('HomeViewModel');

  late Command urlChangedCommand;
  late Command sumbitUrlCommand;

  String _url = "";

  HomeViewModel({required UrlConversionRepository urlConversionRepository})
    : _urlConversionRepository = urlConversionRepository {
    urlChangedCommand = Command.createSyncNoResult<String>(_urlChanged);
    sumbitUrlCommand = Command.createAsyncNoParam<Result<String>?>(
      _submitUrl,
      initialValue: null,
    );
  }

  void _urlChanged(String url) {
    _url = url;
  }

  bool get valid {
    // check if the url is valid to be converted
    if (_url.isEmpty) {
      return false;
    }

    // convert to uri
    try {
      Uri uri = Uri.parse(_url);
      if (!uri.hasAbsolutePath) {
        return false;
      }
    } catch (e) {
      return false;
    }

    return true;
  }

  Future<Result<String>?> _submitUrl() async {
    if (!valid) {
      return Failure(Exception("Invalid url"));
    }

    return Success(_url);
  }
}
