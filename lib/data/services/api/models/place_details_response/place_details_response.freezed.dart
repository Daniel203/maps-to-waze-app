// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceDetailsResponse {

 String get formatted;@JsonKey(name: 'address_line1') String get addressLine1;@JsonKey(name: 'address_line2') String get addressLine2;
/// Create a copy of PlaceDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceDetailsResponseCopyWith<PlaceDetailsResponse> get copyWith => _$PlaceDetailsResponseCopyWithImpl<PlaceDetailsResponse>(this as PlaceDetailsResponse, _$identity);

  /// Serializes this PlaceDetailsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceDetailsResponse&&(identical(other.formatted, formatted) || other.formatted == formatted)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,formatted,addressLine1,addressLine2);

@override
String toString() {
  return 'PlaceDetailsResponse(formatted: $formatted, addressLine1: $addressLine1, addressLine2: $addressLine2)';
}


}

/// @nodoc
abstract mixin class $PlaceDetailsResponseCopyWith<$Res>  {
  factory $PlaceDetailsResponseCopyWith(PlaceDetailsResponse value, $Res Function(PlaceDetailsResponse) _then) = _$PlaceDetailsResponseCopyWithImpl;
@useResult
$Res call({
 String formatted,@JsonKey(name: 'address_line1') String addressLine1,@JsonKey(name: 'address_line2') String addressLine2
});




}
/// @nodoc
class _$PlaceDetailsResponseCopyWithImpl<$Res>
    implements $PlaceDetailsResponseCopyWith<$Res> {
  _$PlaceDetailsResponseCopyWithImpl(this._self, this._then);

  final PlaceDetailsResponse _self;
  final $Res Function(PlaceDetailsResponse) _then;

/// Create a copy of PlaceDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formatted = null,Object? addressLine1 = null,Object? addressLine2 = null,}) {
  return _then(_self.copyWith(
formatted: null == formatted ? _self.formatted : formatted // ignore: cast_nullable_to_non_nullable
as String,addressLine1: null == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String,addressLine2: null == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PlaceDetailsResponse implements PlaceDetailsResponse {
  const _PlaceDetailsResponse({required this.formatted, @JsonKey(name: 'address_line1') required this.addressLine1, @JsonKey(name: 'address_line2') required this.addressLine2});
  factory _PlaceDetailsResponse.fromJson(Map<String, dynamic> json) => _$PlaceDetailsResponseFromJson(json);

@override final  String formatted;
@override@JsonKey(name: 'address_line1') final  String addressLine1;
@override@JsonKey(name: 'address_line2') final  String addressLine2;

/// Create a copy of PlaceDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceDetailsResponseCopyWith<_PlaceDetailsResponse> get copyWith => __$PlaceDetailsResponseCopyWithImpl<_PlaceDetailsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceDetailsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceDetailsResponse&&(identical(other.formatted, formatted) || other.formatted == formatted)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,formatted,addressLine1,addressLine2);

@override
String toString() {
  return 'PlaceDetailsResponse(formatted: $formatted, addressLine1: $addressLine1, addressLine2: $addressLine2)';
}


}

/// @nodoc
abstract mixin class _$PlaceDetailsResponseCopyWith<$Res> implements $PlaceDetailsResponseCopyWith<$Res> {
  factory _$PlaceDetailsResponseCopyWith(_PlaceDetailsResponse value, $Res Function(_PlaceDetailsResponse) _then) = __$PlaceDetailsResponseCopyWithImpl;
@override @useResult
$Res call({
 String formatted,@JsonKey(name: 'address_line1') String addressLine1,@JsonKey(name: 'address_line2') String addressLine2
});




}
/// @nodoc
class __$PlaceDetailsResponseCopyWithImpl<$Res>
    implements _$PlaceDetailsResponseCopyWith<$Res> {
  __$PlaceDetailsResponseCopyWithImpl(this._self, this._then);

  final _PlaceDetailsResponse _self;
  final $Res Function(_PlaceDetailsResponse) _then;

/// Create a copy of PlaceDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formatted = null,Object? addressLine1 = null,Object? addressLine2 = null,}) {
  return _then(_PlaceDetailsResponse(
formatted: null == formatted ? _self.formatted : formatted // ignore: cast_nullable_to_non_nullable
as String,addressLine1: null == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String,addressLine2: null == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
