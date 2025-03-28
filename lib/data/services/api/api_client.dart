import 'package:maps_to_waze/domain/models/url_data/url_data.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ApiClient {
  Future<Result<UrlData>> convertUrl(String url);
}
