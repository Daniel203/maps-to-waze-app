import 'package:freezed_annotation/freezed_annotation.dart';

part 'convert_url_response.freezed.dart';
part 'convert_url_response.g.dart';

@freezed
abstract class CoordinatesResponse with _$CoordinatesResponse {
  const factory CoordinatesResponse({
    required String latitude,
    required String longitude,
  }) = _CoordinatesResponse;

  factory CoordinatesResponse.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesResponseFromJson(json);
}

@freezed
abstract class ConvertUrlResponse with _$ConvertUrlResponse {
  const factory ConvertUrlResponse({
    required String url,
    required CoordinatesResponse coordinates,
  }) = _ConvertUrlResponse;

  factory ConvertUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$ConvertUrlResponseFromJson(json);
}
