import 'package:maps_to_waze/data/services/api/api_client.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:result_dart/result_dart.dart';

class UrlConversionRepository {
  final ApiClient _apiClient;
  final LocalStorageService _localStorageService;

  UrlConversionRepository({
    required ApiClient apiClient,
    required LocalStorageService localStorageService,
  }) : _apiClient = apiClient,
       _localStorageService = localStorageService;

  Future<Result<Conversion>> convertUrl(String url) async {
    try {
      var convertUrlResponse = await _apiClient.convertUrl(url);
      var response = convertUrlResponse.getOrThrow();

      var conversion = Conversion.fromConvertUrlResponse(response);

      // Get static map image
      var staticMapResponse = await _apiClient.getStaticMap(
        conversion.coordinates,
      );
      var mapImageData = staticMapResponse.getOrNull();

      // Store the image on the disk
      if (mapImageData != null && mapImageData.isNotEmpty) {
        var imagePath =
            await _localStorageService
                .saveImageToDisk(mapImageData)
                .getOrNull();
        conversion = conversion.copyWith(mapImagePath: imagePath);
      }

      // Get place details
      var placeDetailsResponse = await _apiClient.getPlaceDetails(
        conversion.coordinates,
      );
      var placeDetails = placeDetailsResponse.getOrNull();
      if (placeDetails != null) {
        conversion = conversion.copyWith(
          addressLine1: placeDetails.addressLine1,
          addressLine2: placeDetails.addressLine2,
          formattedAddress: placeDetails.formatted,
        );
      }

      // Store the conversion in the local storage
      await _localStorageService.saveConversion(conversion);

      return Success(conversion);
    } on Exception catch (error) {
      return Failure(error);
    }
  }
}
