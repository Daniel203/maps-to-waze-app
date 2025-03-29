import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:maps_to_waze/data/services/api/api_client.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion_entity.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
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
  Future<Result<Conversion>> convertUrl(String url) async {
    try {
      var convertUrlResponse = await _apiClient.convertUrl(url);
      var response = convertUrlResponse.getOrThrow();

      var conversion = Conversion.fromResponse(response);

      // Store the conversion in the local storage
      await _localStorageService.saveConversion(conversion);

      return Success(conversion);
    } on Exception catch (error) {
      return Failure(error);
    }
  }

  @override
  Future<Result<List<Conversion>>> getConversionHistory() async {
    try {
      var conversionEntityHistory =
          await _localStorageService.getConversionHistory().getOrThrow();

      List<Conversion> result =
          conversionEntityHistory
              .map((ConversionEntity c) {
                try {
                  return Success(Conversion.fromEntity(c));
                } on Exception {
                  return null;
                }
              })
              .whereType<Success>()
              .map((Success s) => s.getOrNull() as Conversion)
              .toList();

      return Success(result);
    } on Exception catch (error) {
      return Failure(error);
    }
  }
}
