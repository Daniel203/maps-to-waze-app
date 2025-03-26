// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'convert_url_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConvertUrlRequest {

 String get url;
/// Create a copy of ConvertUrlRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConvertUrlRequestCopyWith<ConvertUrlRequest> get copyWith => _$ConvertUrlRequestCopyWithImpl<ConvertUrlRequest>(this as ConvertUrlRequest, _$identity);

  /// Serializes this ConvertUrlRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConvertUrlRequest&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'ConvertUrlRequest(url: $url)';
}


}

/// @nodoc
abstract mixin class $ConvertUrlRequestCopyWith<$Res>  {
  factory $ConvertUrlRequestCopyWith(ConvertUrlRequest value, $Res Function(ConvertUrlRequest) _then) = _$ConvertUrlRequestCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$ConvertUrlRequestCopyWithImpl<$Res>
    implements $ConvertUrlRequestCopyWith<$Res> {
  _$ConvertUrlRequestCopyWithImpl(this._self, this._then);

  final ConvertUrlRequest _self;
  final $Res Function(ConvertUrlRequest) _then;

/// Create a copy of ConvertUrlRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ConvertUrlRequest implements ConvertUrlRequest {
  const _ConvertUrlRequest({required this.url});
  factory _ConvertUrlRequest.fromJson(Map<String, dynamic> json) => _$ConvertUrlRequestFromJson(json);

@override final  String url;

/// Create a copy of ConvertUrlRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConvertUrlRequestCopyWith<_ConvertUrlRequest> get copyWith => __$ConvertUrlRequestCopyWithImpl<_ConvertUrlRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConvertUrlRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConvertUrlRequest&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'ConvertUrlRequest(url: $url)';
}


}

/// @nodoc
abstract mixin class _$ConvertUrlRequestCopyWith<$Res> implements $ConvertUrlRequestCopyWith<$Res> {
  factory _$ConvertUrlRequestCopyWith(_ConvertUrlRequest value, $Res Function(_ConvertUrlRequest) _then) = __$ConvertUrlRequestCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$ConvertUrlRequestCopyWithImpl<$Res>
    implements _$ConvertUrlRequestCopyWith<$Res> {
  __$ConvertUrlRequestCopyWithImpl(this._self, this._then);

  final _ConvertUrlRequest _self;
  final $Res Function(_ConvertUrlRequest) _then;

/// Create a copy of ConvertUrlRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_ConvertUrlRequest(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
