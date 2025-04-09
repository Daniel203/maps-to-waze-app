// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceDetailsResponse _$PlaceDetailsResponseFromJson(
  Map<String, dynamic> json,
) => _PlaceDetailsResponse(
  formatted: json['formatted'] as String,
  addressLine1: json['address_line1'] as String,
  addressLine2: json['address_line2'] as String,
);

Map<String, dynamic> _$PlaceDetailsResponseToJson(
  _PlaceDetailsResponse instance,
) => <String, dynamic>{
  'formatted': instance.formatted,
  'address_line1': instance.addressLine1,
  'address_line2': instance.addressLine2,
};
