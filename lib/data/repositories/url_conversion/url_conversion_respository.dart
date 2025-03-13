import 'package:maps_to_waze/data/services/url_conversion/api_client.dart';
import 'package:result_dart/result_dart.dart';

class UrlConversionRepository {
  final ApiClient _apiClient;

  UrlConversionRepository({required ApiClient apiClient}): _apiClient = apiClient;

  Future<Result<Uri>> convertUrl(String url) async {
    try {
      return _apiClient.convertUrl(url);
    } on Exception catch (error) {
      return Failure(error);
    }
  }
}
