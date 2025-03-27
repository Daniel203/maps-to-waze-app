// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UrlData _$UrlDataFromJson(Map<String, dynamic> json) => _UrlData(
  url: Uri.parse(json['url'] as String),
  coordinates: Coordinates.fromJson(
    json['coordinates'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UrlDataToJson(_UrlData instance) => <String, dynamic>{
  'url': instance.url.toString(),
  'coordinates': instance.coordinates,
};
