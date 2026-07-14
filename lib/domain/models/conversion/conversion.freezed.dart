// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 Uri get url; Coordinates get coordinates; String? get mapImagePath; String? get addressLine1; String? get addressLine2; String? get formattedAddress; int get enrichmentAttempts; bool get isFavorite;
/// Create a copy of Conversion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversionCopyWith<Conversion> get copyWith => _$ConversionCopyWithImpl<Conversion>(this as Conversion, _$identity);

  /// Serializes this Conversion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conversion&&(identical(other.url, url) || other.url == url)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.mapImagePath, mapImagePath) || other.mapImagePath == mapImagePath)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2)&&(identical(other.formattedAddress, formattedAddress) || other.formattedAddress == formattedAddress)&&(identical(other.enrichmentAttempts, enrichmentAttempts) || other.enrichmentAttempts == enrichmentAttempts)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,coordinates,mapImagePath,addressLine1,addressLine2,formattedAddress,enrichmentAttempts,isFavorite);

@override
String toString() {
  return 'Conversion(url: $url, coordinates: $coordinates, mapImagePath: $mapImagePath, addressLine1: $addressLine1, addressLine2: $addressLine2, formattedAddress: $formattedAddress, enrichmentAttempts: $enrichmentAttempts, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $ConversionCopyWith<$Res>  {
  factory $ConversionCopyWith(Conversion value, $Res Function(Conversion) _then) = _$ConversionCopyWithImpl;
@useResult
$Res call({
 Uri url, Coordinates coordinates, String? mapImagePath, String? addressLine1, String? addressLine2, String? formattedAddress, int enrichmentAttempts, bool isFavorite
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
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? coordinates = null,Object? mapImagePath = freezed,Object? addressLine1 = freezed,Object? addressLine2 = freezed,Object? formattedAddress = freezed,Object? enrichmentAttempts = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates,mapImagePath: freezed == mapImagePath ? _self.mapImagePath : mapImagePath // ignore: cast_nullable_to_non_nullable
as String?,addressLine1: freezed == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String?,addressLine2: freezed == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String?,formattedAddress: freezed == formattedAddress ? _self.formattedAddress : formattedAddress // ignore: cast_nullable_to_non_nullable
as String?,enrichmentAttempts: null == enrichmentAttempts ? _self.enrichmentAttempts : enrichmentAttempts // ignore: cast_nullable_to_non_nullable
as int,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
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


/// Adds pattern-matching-related methods to [Conversion].
extension ConversionPatterns on Conversion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Conversion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Conversion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Conversion value)  $default,){
final _that = this;
switch (_that) {
case _Conversion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Conversion value)?  $default,){
final _that = this;
switch (_that) {
case _Conversion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uri url,  Coordinates coordinates,  String? mapImagePath,  String? addressLine1,  String? addressLine2,  String? formattedAddress,  int enrichmentAttempts,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Conversion() when $default != null:
return $default(_that.url,_that.coordinates,_that.mapImagePath,_that.addressLine1,_that.addressLine2,_that.formattedAddress,_that.enrichmentAttempts,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uri url,  Coordinates coordinates,  String? mapImagePath,  String? addressLine1,  String? addressLine2,  String? formattedAddress,  int enrichmentAttempts,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _Conversion():
return $default(_that.url,_that.coordinates,_that.mapImagePath,_that.addressLine1,_that.addressLine2,_that.formattedAddress,_that.enrichmentAttempts,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uri url,  Coordinates coordinates,  String? mapImagePath,  String? addressLine1,  String? addressLine2,  String? formattedAddress,  int enrichmentAttempts,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _Conversion() when $default != null:
return $default(_that.url,_that.coordinates,_that.mapImagePath,_that.addressLine1,_that.addressLine2,_that.formattedAddress,_that.enrichmentAttempts,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Conversion implements Conversion {
  const _Conversion({required this.url, required this.coordinates, this.mapImagePath, this.addressLine1, this.addressLine2, this.formattedAddress, this.enrichmentAttempts = 0, this.isFavorite = false});
  factory _Conversion.fromJson(Map<String, dynamic> json) => _$ConversionFromJson(json);

@override final  Uri url;
@override final  Coordinates coordinates;
@override final  String? mapImagePath;
@override final  String? addressLine1;
@override final  String? addressLine2;
@override final  String? formattedAddress;
@override@JsonKey() final  int enrichmentAttempts;
@override@JsonKey() final  bool isFavorite;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conversion&&(identical(other.url, url) || other.url == url)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.mapImagePath, mapImagePath) || other.mapImagePath == mapImagePath)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2)&&(identical(other.formattedAddress, formattedAddress) || other.formattedAddress == formattedAddress)&&(identical(other.enrichmentAttempts, enrichmentAttempts) || other.enrichmentAttempts == enrichmentAttempts)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,coordinates,mapImagePath,addressLine1,addressLine2,formattedAddress,enrichmentAttempts,isFavorite);

@override
String toString() {
  return 'Conversion(url: $url, coordinates: $coordinates, mapImagePath: $mapImagePath, addressLine1: $addressLine1, addressLine2: $addressLine2, formattedAddress: $formattedAddress, enrichmentAttempts: $enrichmentAttempts, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$ConversionCopyWith<$Res> implements $ConversionCopyWith<$Res> {
  factory _$ConversionCopyWith(_Conversion value, $Res Function(_Conversion) _then) = __$ConversionCopyWithImpl;
@override @useResult
$Res call({
 Uri url, Coordinates coordinates, String? mapImagePath, String? addressLine1, String? addressLine2, String? formattedAddress, int enrichmentAttempts, bool isFavorite
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
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? coordinates = null,Object? mapImagePath = freezed,Object? addressLine1 = freezed,Object? addressLine2 = freezed,Object? formattedAddress = freezed,Object? enrichmentAttempts = null,Object? isFavorite = null,}) {
  return _then(_Conversion(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates,mapImagePath: freezed == mapImagePath ? _self.mapImagePath : mapImagePath // ignore: cast_nullable_to_non_nullable
as String?,addressLine1: freezed == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String?,addressLine2: freezed == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String?,formattedAddress: freezed == formattedAddress ? _self.formattedAddress : formattedAddress // ignore: cast_nullable_to_non_nullable
as String?,enrichmentAttempts: null == enrichmentAttempts ? _self.enrichmentAttempts : enrichmentAttempts // ignore: cast_nullable_to_non_nullable
as int,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
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
