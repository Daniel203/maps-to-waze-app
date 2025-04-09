// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Conversion {

 Uri get url; Coordinates get coordinates; String? get mapImagePath; String? get addressLine1; String? get addressLine2; String? get formattedAddress;
/// Create a copy of Conversion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversionCopyWith<Conversion> get copyWith => _$ConversionCopyWithImpl<Conversion>(this as Conversion, _$identity);

  /// Serializes this Conversion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conversion&&(identical(other.url, url) || other.url == url)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.mapImagePath, mapImagePath) || other.mapImagePath == mapImagePath)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2)&&(identical(other.formattedAddress, formattedAddress) || other.formattedAddress == formattedAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,coordinates,mapImagePath,addressLine1,addressLine2,formattedAddress);

@override
String toString() {
  return 'Conversion(url: $url, coordinates: $coordinates, mapImagePath: $mapImagePath, addressLine1: $addressLine1, addressLine2: $addressLine2, formattedAddress: $formattedAddress)';
}


}

/// @nodoc
abstract mixin class $ConversionCopyWith<$Res>  {
  factory $ConversionCopyWith(Conversion value, $Res Function(Conversion) _then) = _$ConversionCopyWithImpl;
@useResult
$Res call({
 Uri url, Coordinates coordinates, String? mapImagePath, String? addressLine1, String? addressLine2, String? formattedAddress
});


$CoordinatesCopyWith<$Res> get coordinates;

}
/// @nodoc
class _$ConversionCopyWithImpl<$Res>
    implements $ConversionCopyWith<$Res> {
  _$ConversionCopyWithImpl(this._self, this._then);

  final Conversion _self;
  final $Res Function(Conversion) _then;

/// Create a copy of Conversion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? coordinates = null,Object? mapImagePath = freezed,Object? addressLine1 = freezed,Object? addressLine2 = freezed,Object? formattedAddress = freezed,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates,mapImagePath: freezed == mapImagePath ? _self.mapImagePath : mapImagePath // ignore: cast_nullable_to_non_nullable
as String?,addressLine1: freezed == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String?,addressLine2: freezed == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String?,formattedAddress: freezed == formattedAddress ? _self.formattedAddress : formattedAddress // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Conversion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatesCopyWith<$Res> get coordinates {
  
  return $CoordinatesCopyWith<$Res>(_self.coordinates, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Conversion implements Conversion {
  const _Conversion({required this.url, required this.coordinates, this.mapImagePath, this.addressLine1, this.addressLine2, this.formattedAddress});
  factory _Conversion.fromJson(Map<String, dynamic> json) => _$ConversionFromJson(json);

@override final  Uri url;
@override final  Coordinates coordinates;
@override final  String? mapImagePath;
@override final  String? addressLine1;
@override final  String? addressLine2;
@override final  String? formattedAddress;

/// Create a copy of Conversion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversionCopyWith<_Conversion> get copyWith => __$ConversionCopyWithImpl<_Conversion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conversion&&(identical(other.url, url) || other.url == url)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.mapImagePath, mapImagePath) || other.mapImagePath == mapImagePath)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2)&&(identical(other.formattedAddress, formattedAddress) || other.formattedAddress == formattedAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,coordinates,mapImagePath,addressLine1,addressLine2,formattedAddress);

@override
String toString() {
  return 'Conversion(url: $url, coordinates: $coordinates, mapImagePath: $mapImagePath, addressLine1: $addressLine1, addressLine2: $addressLine2, formattedAddress: $formattedAddress)';
}


}

/// @nodoc
abstract mixin class _$ConversionCopyWith<$Res> implements $ConversionCopyWith<$Res> {
  factory _$ConversionCopyWith(_Conversion value, $Res Function(_Conversion) _then) = __$ConversionCopyWithImpl;
@override @useResult
$Res call({
 Uri url, Coordinates coordinates, String? mapImagePath, String? addressLine1, String? addressLine2, String? formattedAddress
});


@override $CoordinatesCopyWith<$Res> get coordinates;

}
/// @nodoc
class __$ConversionCopyWithImpl<$Res>
    implements _$ConversionCopyWith<$Res> {
  __$ConversionCopyWithImpl(this._self, this._then);

  final _Conversion _self;
  final $Res Function(_Conversion) _then;

/// Create a copy of Conversion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? coordinates = null,Object? mapImagePath = freezed,Object? addressLine1 = freezed,Object? addressLine2 = freezed,Object? formattedAddress = freezed,}) {
  return _then(_Conversion(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates,mapImagePath: freezed == mapImagePath ? _self.mapImagePath : mapImagePath // ignore: cast_nullable_to_non_nullable
as String?,addressLine1: freezed == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String?,addressLine2: freezed == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String?,formattedAddress: freezed == formattedAddress ? _self.formattedAddress : formattedAddress // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Conversion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatesCopyWith<$Res> get coordinates {
  
  return $CoordinatesCopyWith<$Res>(_self.coordinates, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}

// dart format on
