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

 Uri get url; Coordinates get coordinates;
/// Create a copy of Conversion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversionCopyWith<Conversion> get copyWith => _$ConversionCopyWithImpl<Conversion>(this as Conversion, _$identity);

  /// Serializes this Conversion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conversion&&(identical(other.url, url) || other.url == url)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,coordinates);

@override
String toString() {
  return 'Conversion(url: $url, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class $ConversionCopyWith<$Res>  {
  factory $ConversionCopyWith(Conversion value, $Res Function(Conversion) _then) = _$ConversionCopyWithImpl;
@useResult
$Res call({
 Uri url, Coordinates coordinates
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
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? coordinates = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates,
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
  const _Conversion({required this.url, required this.coordinates});
  factory _Conversion.fromJson(Map<String, dynamic> json) => _$ConversionFromJson(json);

@override final  Uri url;
@override final  Coordinates coordinates;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conversion&&(identical(other.url, url) || other.url == url)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,coordinates);

@override
String toString() {
  return 'Conversion(url: $url, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$ConversionCopyWith<$Res> implements $ConversionCopyWith<$Res> {
  factory _$ConversionCopyWith(_Conversion value, $Res Function(_Conversion) _then) = __$ConversionCopyWithImpl;
@override @useResult
$Res call({
 Uri url, Coordinates coordinates
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
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? coordinates = null,}) {
  return _then(_Conversion(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates,
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
