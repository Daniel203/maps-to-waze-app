import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_details_response.freezed.dart';
part 'place_details_response.g.dart';

@freezed
abstract class PlaceDetailsResponse with _$PlaceDetailsResponse {
  const factory PlaceDetailsResponse({
    required String formatted,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'address_line1') required String addressLine1,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'address_line2') required String addressLine2,
  }) = _PlaceDetailsResponse;

  factory PlaceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsResponseFromJson(json);
}
