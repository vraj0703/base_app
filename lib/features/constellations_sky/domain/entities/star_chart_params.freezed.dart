// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'star_chart_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StarChartParams {

 double get latitude; double get longitude; DateTime get date; String get style; String get constellationId;
/// Create a copy of StarChartParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StarChartParamsCopyWith<StarChartParams> get copyWith => _$StarChartParamsCopyWithImpl<StarChartParams>(this as StarChartParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StarChartParams&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.date, date) || other.date == date)&&(identical(other.style, style) || other.style == style)&&(identical(other.constellationId, constellationId) || other.constellationId == constellationId));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,date,style,constellationId);

@override
String toString() {
  return 'StarChartParams(latitude: $latitude, longitude: $longitude, date: $date, style: $style, constellationId: $constellationId)';
}


}

/// @nodoc
abstract mixin class $StarChartParamsCopyWith<$Res>  {
  factory $StarChartParamsCopyWith(StarChartParams value, $Res Function(StarChartParams) _then) = _$StarChartParamsCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, DateTime date, String style, String constellationId
});




}
/// @nodoc
class _$StarChartParamsCopyWithImpl<$Res>
    implements $StarChartParamsCopyWith<$Res> {
  _$StarChartParamsCopyWithImpl(this._self, this._then);

  final StarChartParams _self;
  final $Res Function(StarChartParams) _then;

/// Create a copy of StarChartParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? date = null,Object? style = null,Object? constellationId = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String,constellationId: null == constellationId ? _self.constellationId : constellationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StarChartParams].
extension StarChartParamsPatterns on StarChartParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StarChartParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StarChartParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StarChartParams value)  $default,){
final _that = this;
switch (_that) {
case _StarChartParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StarChartParams value)?  $default,){
final _that = this;
switch (_that) {
case _StarChartParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  DateTime date,  String style,  String constellationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StarChartParams() when $default != null:
return $default(_that.latitude,_that.longitude,_that.date,_that.style,_that.constellationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  DateTime date,  String style,  String constellationId)  $default,) {final _that = this;
switch (_that) {
case _StarChartParams():
return $default(_that.latitude,_that.longitude,_that.date,_that.style,_that.constellationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  DateTime date,  String style,  String constellationId)?  $default,) {final _that = this;
switch (_that) {
case _StarChartParams() when $default != null:
return $default(_that.latitude,_that.longitude,_that.date,_that.style,_that.constellationId);case _:
  return null;

}
}

}

/// @nodoc


class _StarChartParams implements StarChartParams {
  const _StarChartParams({required this.latitude, required this.longitude, required this.date, this.style = 'default', this.constellationId = 'ori'});
  

@override final  double latitude;
@override final  double longitude;
@override final  DateTime date;
@override@JsonKey() final  String style;
@override@JsonKey() final  String constellationId;

/// Create a copy of StarChartParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StarChartParamsCopyWith<_StarChartParams> get copyWith => __$StarChartParamsCopyWithImpl<_StarChartParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StarChartParams&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.date, date) || other.date == date)&&(identical(other.style, style) || other.style == style)&&(identical(other.constellationId, constellationId) || other.constellationId == constellationId));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,date,style,constellationId);

@override
String toString() {
  return 'StarChartParams(latitude: $latitude, longitude: $longitude, date: $date, style: $style, constellationId: $constellationId)';
}


}

/// @nodoc
abstract mixin class _$StarChartParamsCopyWith<$Res> implements $StarChartParamsCopyWith<$Res> {
  factory _$StarChartParamsCopyWith(_StarChartParams value, $Res Function(_StarChartParams) _then) = __$StarChartParamsCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, DateTime date, String style, String constellationId
});




}
/// @nodoc
class __$StarChartParamsCopyWithImpl<$Res>
    implements _$StarChartParamsCopyWith<$Res> {
  __$StarChartParamsCopyWithImpl(this._self, this._then);

  final _StarChartParams _self;
  final $Res Function(_StarChartParams) _then;

/// Create a copy of StarChartParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? date = null,Object? style = null,Object? constellationId = null,}) {
  return _then(_StarChartParams(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String,constellationId: null == constellationId ? _self.constellationId : constellationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
