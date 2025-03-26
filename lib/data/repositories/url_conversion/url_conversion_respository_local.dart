import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:maps_to_waze/data/services/api/models/convert_url_response/convert_url_response.dart';
import 'package:maps_to_waze/data/services/local/local_data_service.dart';
import 'package:result_dart/result_dart.dart';

class UrlConversionRepositoryLocal implements UrlConversionRepository {
  final LocalDataService _localDataService;

  UrlConversionRepositoryLocal({required LocalDataService localDataService})
    : _localDataService = localDataService;

  @override
  Future<Result<ConvertUrlResponse>> convertUrl(String url) async {
    try {
      return _localDataService.convertUrl(url);
    } on Exception catch (error) {
      return Failure(error);
    }
  }
}

