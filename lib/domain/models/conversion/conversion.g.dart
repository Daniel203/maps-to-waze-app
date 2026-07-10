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
  mapImagePath: json['mapImagePath'] as String?,
  addressLine1: json['addressLine1'] as String?,
  addressLine2: json['addressLine2'] as String?,
  formattedAddress: json['formattedAddress'] as String?,
  enrichmentAttempts: (json['enrichmentAttempts'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ConversionToJson(_Conversion instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'coordinates': instance.coordinates,
      'mapImagePath': instance.mapImagePath,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'formattedAddress': instance.formattedAddress,
      'enrichmentAttempts': instance.enrichmentAttempts,
    };
