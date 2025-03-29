// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoordinatesResponse _$CoordinatesResponseFromJson(Map<String, dynamic> json) =>
    _CoordinatesResponse(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$CoordinatesResponseToJson(
  _CoordinatesResponse instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};

_ConvertUrlResponse _$ConvertUrlResponseFromJson(Map<String, dynamic> json) =>
    _ConvertUrlResponse(
      url: json['url'] as String,
      coordinates: CoordinatesResponse.fromJson(
        json['coordinates'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ConvertUrlResponseToJson(_ConvertUrlResponse instance) =>
    <String, dynamic>{'url': instance.url, 'coordinates': instance.coordinates};
