// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'url_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UrlData {

 Uri get url; Coordinates get coordinates;
/// Create a copy of UrlData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UrlDataCopyWith<UrlData> get copyWith => _$UrlDataCopyWithImpl<UrlData>(this as UrlData, _$identity);

  /// Serializes this UrlData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UrlData&&(identical(other.url, url) || other.url == url)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,coordinates);

@override
String toString() {
  return 'UrlData(url: $url, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class $UrlDataCopyWith<$Res>  {
  factory $UrlDataCopyWith(UrlData value, $Res Function(UrlData) _then) = _$UrlDataCopyWithImpl;
@useResult
$Res call({
 Uri url, Coordinates coordinates
});


$CoordinatesCopyWith<$Res> get coordinates;

}
/// @nodoc
class _$UrlDataCopyWithImpl<$Res>
    implements $UrlDataCopyWith<$Res> {
  _$UrlDataCopyWithImpl(this._self, this._then);

  final UrlData _self;
  final $Res Function(UrlData) _then;

/// Create a copy of UrlData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? coordinates = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates,
  ));
}
/// Create a copy of UrlData
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

class _UrlData implements UrlData {
  const _UrlData({required this.url, required this.coordinates});
  factory _UrlData.fromJson(Map<String, dynamic> json) => _$UrlDataFromJson(json);

@override final  Uri url;
@override final  Coordinates coordinates;

/// Create a copy of UrlData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UrlDataCopyWith<_UrlData> get copyWith => __$UrlDataCopyWithImpl<_UrlData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UrlDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UrlData&&(identical(other.url, url) || other.url == url)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,coordinates);

@override
String toString() {
  return 'UrlData(url: $url, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$UrlDataCopyWith<$Res> implements $UrlDataCopyWith<$Res> {
  factory _$UrlDataCopyWith(_UrlData value, $Res Function(_UrlData) _then) = __$UrlDataCopyWithImpl;
@override @useResult
$Res call({
 Uri url, Coordinates coordinates
});


@override $CoordinatesCopyWith<$Res> get coordinates;

}
/// @nodoc
class __$UrlDataCopyWithImpl<$Res>
    implements _$UrlDataCopyWith<$Res> {
  __$UrlDataCopyWithImpl(this._self, this._then);

  final _UrlData _self;
  final $Res Function(_UrlData) _then;

/// Create a copy of UrlData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? coordinates = null,}) {
  return _then(_UrlData(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates,
  ));
}

/// Create a copy of UrlData
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
