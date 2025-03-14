import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';

class HomeViewModel extends ChangeNotifier {
  final UrlConversionRepository _urlConversionRepository;
  final _log = Logger('HomeViewModel');

  HomeViewModel({required UrlConversionRepository urlConversionRepository})
    : _urlConversionRepository = urlConversionRepository;
}
