// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'url_conversion_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UrlConversionApiModel {

 String get url;
/// Create a copy of UrlConversionApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UrlConversionApiModelCopyWith<UrlConversionApiModel> get copyWith => _$UrlConversionApiModelCopyWithImpl<UrlConversionApiModel>(this as UrlConversionApiModel, _$identity);

  /// Serializes this UrlConversionApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UrlConversionApiModel&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'UrlConversionApiModel(url: $url)';
}


}

/// @nodoc
abstract mixin class $UrlConversionApiModelCopyWith<$Res>  {
  factory $UrlConversionApiModelCopyWith(UrlConversionApiModel value, $Res Function(UrlConversionApiModel) _then) = _$UrlConversionApiModelCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$UrlConversionApiModelCopyWithImpl<$Res>
    implements $UrlConversionApiModelCopyWith<$Res> {
  _$UrlConversionApiModelCopyWithImpl(this._self, this._then);

  final UrlConversionApiModel _self;
  final $Res Function(UrlConversionApiModel) _then;

/// Create a copy of UrlConversionApiModel
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

class _UrlConversionApiModel implements UrlConversionApiModel {
  const _UrlConversionApiModel({required this.url});
  factory _UrlConversionApiModel.fromJson(Map<String, dynamic> json) => _$UrlConversionApiModelFromJson(json);

@override final  String url;

/// Create a copy of UrlConversionApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UrlConversionApiModelCopyWith<_UrlConversionApiModel> get copyWith => __$UrlConversionApiModelCopyWithImpl<_UrlConversionApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UrlConversionApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UrlConversionApiModel&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'UrlConversionApiModel(url: $url)';
}


}

/// @nodoc
abstract mixin class _$UrlConversionApiModelCopyWith<$Res> implements $UrlConversionApiModelCopyWith<$Res> {
  factory _$UrlConversionApiModelCopyWith(_UrlConversionApiModel value, $Res Function(_UrlConversionApiModel) _then) = __$UrlConversionApiModelCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$UrlConversionApiModelCopyWithImpl<$Res>
    implements _$UrlConversionApiModelCopyWith<$Res> {
  __$UrlConversionApiModelCopyWithImpl(this._self, this._then);

  final _UrlConversionApiModel _self;
  final $Res Function(_UrlConversionApiModel) _then;

/// Create a copy of UrlConversionApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_UrlConversionApiModel(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
