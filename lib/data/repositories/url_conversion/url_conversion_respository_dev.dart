import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:maps_to_waze/data/services/api/api_client.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion.dart';
import 'package:maps_to_waze/domain/models/url_data/url_data.dart';
import 'package:result_dart/result_dart.dart';

class UrlConversionRepositoryDev implements UrlConversionRepository {
  final ApiClient _apiClient;
  final LocalStorageService _localStorageService;

  UrlConversionRepositoryDev({
    required ApiClient apiClient,
    required LocalStorageService localStorageService,
  }) : _apiClient = apiClient,
       _localStorageService = localStorageService;

  @override
  Future<Result<UrlData>> convertUrl(String url) async {
    try {
      var response = await _apiClient.convertUrl(url);
      var urlData = response.getOrThrow();

      // Store the conversion in the local storage
      await _localStorageService.saveConversion(urlData);

      return Success(urlData);
    } on Exception catch (error) {
      return Failure(error);
    }
  }

  @override
  Future<Result<List<Conversion>>> getConversionHistory() async {
    return await _localStorageService.getConversionHistory();
  }
}
