// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConvertUrlResponse _$ConvertUrlResponseFromJson(Map<String, dynamic> json) =>
    _ConvertUrlResponse(
      url: Uri.parse(json['url'] as String),
      coordinates: Coordinates.fromJson(
        json['coordinates'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ConvertUrlResponseToJson(_ConvertUrlResponse instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'coordinates': instance.coordinates,
    };
