// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Conversion _$ConversionFromJson(Map<String, dynamic> json) => _Conversion(
  url: Uri.parse(json['url'] as String),
  coordinates: Coordinates.fromJson(
    json['coordinates'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ConversionToJson(_Conversion instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'coordinates': instance.coordinates,
    };
