import 'package:maps_to_waze/data/services/api/models/convert_url_response/convert_url_response.dart';
import 'package:result_dart/result_dart.dart';

abstract class UrlConversionRepository {
  Future<Result<ConvertUrlResponse>> convertUrl(String url);
}
