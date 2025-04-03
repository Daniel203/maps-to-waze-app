import 'dart:typed_data';
import 'package:maps_to_waze/data/services/api/models/convert_url_response/convert_url_response.dart';
import 'package:maps_to_waze/domain/models/coordinates/coordinates.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ApiClient {
  Future<Result<ConvertUrlResponse>> convertUrl(String url);
  Future<Result<Uint8List>> getStaticMap(Coordinates coordinates);
}
