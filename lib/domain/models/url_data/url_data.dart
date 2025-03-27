import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maps_to_waze/domain/models/coordinates/coordinates.dart';

part 'url_data.freezed.dart';
part 'url_data.g.dart';

@freezed
abstract class UrlData with _$UrlData {
  const factory UrlData({
    required Uri url,
    required Coordinates coordinates
  }) = _UrlData;

  factory UrlData.fromJson(Map<String, dynamic> json) =>
      _$UrlDataFromJson(json);
}
