import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maps_to_waze/data/services/api/models/coordinates/coordinates.dart';

part 'convert_url_response.freezed.dart';
part 'convert_url_response.g.dart';

@freezed
abstract class ConvertUrlResponse with _$ConvertUrlResponse {
  const factory ConvertUrlResponse({
    required Uri url,
    required Coordinates coordinates
  }) = _ConvertUrlResponse;

  factory ConvertUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$ConvertUrlResponseFromJson(json);
}
