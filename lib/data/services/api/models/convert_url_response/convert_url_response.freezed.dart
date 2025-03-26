// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'convert_url_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConvertUrlResponse {

 Uri get url; Coordinates get coordinates;
/// Create a copy of ConvertUrlResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConvertUrlResponseCopyWith<ConvertUrlResponse> get copyWith => _$ConvertUrlResponseCopyWithImpl<ConvertUrlResponse>(this as ConvertUrlResponse, _$identity);

  /// Serializes this ConvertUrlResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConvertUrlResponse&&(identical(other.url, url) || other.url == url)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,coordinates);

@override
String toString() {
  return 'ConvertUrlResponse(url: $url, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class $ConvertUrlResponseCopyWith<$Res>  {
  factory $ConvertUrlResponseCopyWith(ConvertUrlResponse value, $Res Function(ConvertUrlResponse) _then) = _$ConvertUrlResponseCopyWithImpl;
@useResult
$Res call({
 Uri url, Coordinates coordinates
});


$CoordinatesCopyWith<$Res> get coordinates;

}
/// @nodoc
class _$ConvertUrlResponseCopyWithImpl<$Res>
    implements $ConvertUrlResponseCopyWith<$Res> {
  _$ConvertUrlResponseCopyWithImpl(this._self, this._then);

  final ConvertUrlResponse _self;
  final $Res Function(ConvertUrlResponse) _then;

/// Create a copy of ConvertUrlResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? coordinates = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates,
  ));
}
/// Create a copy of ConvertUrlResponse
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

class _ConvertUrlResponse implements ConvertUrlResponse {
  const _ConvertUrlResponse({required this.url, required this.coordinates});
  factory _ConvertUrlResponse.fromJson(Map<String, dynamic> json) => _$ConvertUrlResponseFromJson(json);

@override final  Uri url;
@override final  Coordinates coordinates;

/// Create a copy of ConvertUrlResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConvertUrlResponseCopyWith<_ConvertUrlResponse> get copyWith => __$ConvertUrlResponseCopyWithImpl<_ConvertUrlResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConvertUrlResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConvertUrlResponse&&(identical(other.url, url) || other.url == url)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,coordinates);

@override
String toString() {
  return 'ConvertUrlResponse(url: $url, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$ConvertUrlResponseCopyWith<$Res> implements $ConvertUrlResponseCopyWith<$Res> {
  factory _$ConvertUrlResponseCopyWith(_ConvertUrlResponse value, $Res Function(_ConvertUrlResponse) _then) = __$ConvertUrlResponseCopyWithImpl;
@override @useResult
$Res call({
 Uri url, Coordinates coordinates
});


@override $CoordinatesCopyWith<$Res> get coordinates;

}
/// @nodoc
class __$ConvertUrlResponseCopyWithImpl<$Res>
    implements _$ConvertUrlResponseCopyWith<$Res> {
  __$ConvertUrlResponseCopyWithImpl(this._self, this._then);

  final _ConvertUrlResponse _self;
  final $Res Function(_ConvertUrlResponse) _then;

/// Create a copy of ConvertUrlResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? coordinates = null,}) {
  return _then(_ConvertUrlResponse(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates,
  ));
}

/// Create a copy of ConvertUrlResponse
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
