import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:maps_to_waze/data/services/api/api_client.dart';
import 'package:result_dart/result_dart.dart';

class UrlConversionRepositoryRemote implements UrlConversionRepository {
  final ApiClient _apiClient;

  UrlConversionRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<Result<Uri>> convertUrl(String url) async {
    try {
      return _apiClient.convertUrl(url);
    } on Exception catch (error) {
      return Failure(error);
    }
  }
}
