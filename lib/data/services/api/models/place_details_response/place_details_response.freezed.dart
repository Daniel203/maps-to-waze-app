// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 String get formatted;// ignore: invalid_annotation_target
@JsonKey(name: 'address_line1') String get addressLine1;// ignore: invalid_annotation_target
@JsonKey(name: 'address_line2') String get addressLine2;
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


/// Adds pattern-matching-related methods to [PlaceDetailsResponse].
extension PlaceDetailsResponsePatterns on PlaceDetailsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceDetailsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceDetailsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceDetailsResponse value)  $default,){
final _that = this;
switch (_that) {
case _PlaceDetailsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceDetailsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceDetailsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String formatted, @JsonKey(name: 'address_line1')  String addressLine1, @JsonKey(name: 'address_line2')  String addressLine2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceDetailsResponse() when $default != null:
return $default(_that.formatted,_that.addressLine1,_that.addressLine2);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String formatted, @JsonKey(name: 'address_line1')  String addressLine1, @JsonKey(name: 'address_line2')  String addressLine2)  $default,) {final _that = this;
switch (_that) {
case _PlaceDetailsResponse():
return $default(_that.formatted,_that.addressLine1,_that.addressLine2);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String formatted, @JsonKey(name: 'address_line1')  String addressLine1, @JsonKey(name: 'address_line2')  String addressLine2)?  $default,) {final _that = this;
switch (_that) {
case _PlaceDetailsResponse() when $default != null:
return $default(_that.formatted,_that.addressLine1,_that.addressLine2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceDetailsResponse implements PlaceDetailsResponse {
  const _PlaceDetailsResponse({required this.formatted, @JsonKey(name: 'address_line1') required this.addressLine1, @JsonKey(name: 'address_line2') required this.addressLine2});
  factory _PlaceDetailsResponse.fromJson(Map<String, dynamic> json) => _$PlaceDetailsResponseFromJson(json);

@override final  String formatted;
// ignore: invalid_annotation_target
@override@JsonKey(name: 'address_line1') final  String addressLine1;
// ignore: invalid_annotation_target
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
