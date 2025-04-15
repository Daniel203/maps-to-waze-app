import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_repository.dart';

class UrlConversionRepositoryDev extends UrlConversionRepository {
  UrlConversionRepositoryDev({
    required super.apiClient,
    required super.localStorageService,
  });
}
