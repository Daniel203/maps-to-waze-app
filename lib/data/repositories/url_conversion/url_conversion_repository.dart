import 'dart:async';
import 'dart:typed_data';

import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/services/api/api_client.dart';
import 'package:maps_to_waze/data/services/api/models/place_details_response/place_details_response.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:result_dart/result_dart.dart';

class UrlConversionRepository {
  final ApiClient _apiClient;
  final LocalStorageService _localStorageService;
  final _log = Logger('UrlConversionRepository');

  UrlConversionRepository({
    required ApiClient apiClient,
    required LocalStorageService localStorageService,
  }) : _apiClient = apiClient,
       _localStorageService = localStorageService;

  Future<Result<Uri>> convertUrl(String url) async {
    try {
      var convertUrlResponse = await _apiClient.convertUrl(url);
      var response = convertUrlResponse.getOrThrow();

      var conversion = Conversion.fromConvertUrlResponse(response);

      await _localStorageService.saveConversion(conversion);

      _log.info("Url converted successfully");
      return Success(conversion.url);
    } on Exception catch (error) {
      _log.warning("Failed to convert url: $error");
      return Failure(error);
    }
  }

  Future<Result<Conversion>> hydrateConversion(Conversion conversion) async {
    try {
      var results = await Future.wait<Object>([
        _apiClient.getStaticMap(conversion.coordinates),
        _apiClient.getPlaceDetails(conversion.coordinates),
      ]);

      var updatedConversion = conversion;

      if (results[0] is Result<Uint8List>) {
        var mapImageData = (results[0] as Result<Uint8List>).getOrNull();
        if (mapImageData != null && mapImageData.isNotEmpty) {
          var imagePath =
              await _localStorageService
                  .saveImageToDisk(mapImageData)
                  .getOrNull();
          if (imagePath != null) {
            updatedConversion = updatedConversion.copyWith(
              mapImagePath: imagePath,
            );
          }
        }
      }

      if (results[1] is Result<PlaceDetailsResponse>) {
        var placeDetails =
            (results[1] as Result<PlaceDetailsResponse>).getOrNull();
        if (placeDetails != null) {
          updatedConversion = updatedConversion.copyWith(
            addressLine1: placeDetails.addressLine1,
            addressLine2: placeDetails.addressLine2,
            formattedAddress: placeDetails.formatted,
          );
        }
      }

      await _localStorageService.updateConversion(updatedConversion);

      _log.info("Conversion hydrated successfully");
      return Success(updatedConversion);
    } on Exception catch (error) {
      _log.warning("Failed to hydrate conversion: $error");
      return Failure(error);
    }
  }
}
