// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent()';
}


}

/// @nodoc
class $AppEventCopyWith<$Res>  {
$AppEventCopyWith(AppEvent _, $Res Function(AppEvent) __);
}


/// Adds pattern-matching-related methods to [AppEvent].
extension AppEventPatterns on AppEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Configure value)?  configure,TResult Function( ConfigureWithContext value)?  configureWithContext,TResult Function( RefreshFeatureFlag value)?  refreshFeatureFlag,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Configure() when configure != null:
return configure(_that);case ConfigureWithContext() when configureWithContext != null:
return configureWithContext(_that);case RefreshFeatureFlag() when refreshFeatureFlag != null:
return refreshFeatureFlag(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Configure value)  configure,required TResult Function( ConfigureWithContext value)  configureWithContext,required TResult Function( RefreshFeatureFlag value)  refreshFeatureFlag,}){
final _that = this;
switch (_that) {
case Configure():
return configure(_that);case ConfigureWithContext():
return configureWithContext(_that);case RefreshFeatureFlag():
return refreshFeatureFlag(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Configure value)?  configure,TResult? Function( ConfigureWithContext value)?  configureWithContext,TResult? Function( RefreshFeatureFlag value)?  refreshFeatureFlag,}){
final _that = this;
switch (_that) {
case Configure() when configure != null:
return configure(_that);case ConfigureWithContext() when configureWithContext != null:
return configureWithContext(_that);case RefreshFeatureFlag() when refreshFeatureFlag != null:
return refreshFeatureFlag(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( BootLoad? initialLoad)?  configure,TResult Function( ContextCollects collects)?  configureWithContext,TResult Function()?  refreshFeatureFlag,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Configure() when configure != null:
return configure(_that.initialLoad);case ConfigureWithContext() when configureWithContext != null:
return configureWithContext(_that.collects);case RefreshFeatureFlag() when refreshFeatureFlag != null:
return refreshFeatureFlag();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( BootLoad? initialLoad)  configure,required TResult Function( ContextCollects collects)  configureWithContext,required TResult Function()  refreshFeatureFlag,}) {final _that = this;
switch (_that) {
case Configure():
return configure(_that.initialLoad);case ConfigureWithContext():
return configureWithContext(_that.collects);case RefreshFeatureFlag():
return refreshFeatureFlag();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( BootLoad? initialLoad)?  configure,TResult? Function( ContextCollects collects)?  configureWithContext,TResult? Function()?  refreshFeatureFlag,}) {final _that = this;
switch (_that) {
case Configure() when configure != null:
return configure(_that.initialLoad);case ConfigureWithContext() when configureWithContext != null:
return configureWithContext(_that.collects);case RefreshFeatureFlag() when refreshFeatureFlag != null:
return refreshFeatureFlag();case _:
  return null;

}
}

}

/// @nodoc


class Configure implements AppEvent {
  const Configure(this.initialLoad);
  

 final  BootLoad? initialLoad;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigureCopyWith<Configure> get copyWith => _$ConfigureCopyWithImpl<Configure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Configure&&(identical(other.initialLoad, initialLoad) || other.initialLoad == initialLoad));
}


@override
int get hashCode => Object.hash(runtimeType,initialLoad);

@override
String toString() {
  return 'AppEvent.configure(initialLoad: $initialLoad)';
}


}

/// @nodoc
abstract mixin class $ConfigureCopyWith<$Res> implements $AppEventCopyWith<$Res> {
  factory $ConfigureCopyWith(Configure value, $Res Function(Configure) _then) = _$ConfigureCopyWithImpl;
@useResult
$Res call({
 BootLoad? initialLoad
});




}
/// @nodoc
class _$ConfigureCopyWithImpl<$Res>
    implements $ConfigureCopyWith<$Res> {
  _$ConfigureCopyWithImpl(this._self, this._then);

  final Configure _self;
  final $Res Function(Configure) _then;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? initialLoad = freezed,}) {
  return _then(Configure(
freezed == initialLoad ? _self.initialLoad : initialLoad // ignore: cast_nullable_to_non_nullable
as BootLoad?,
  ));
}


}

/// @nodoc


class ConfigureWithContext implements AppEvent {
  const ConfigureWithContext(this.collects);
  

 final  ContextCollects collects;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigureWithContextCopyWith<ConfigureWithContext> get copyWith => _$ConfigureWithContextCopyWithImpl<ConfigureWithContext>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigureWithContext&&(identical(other.collects, collects) || other.collects == collects));
}


@override
int get hashCode => Object.hash(runtimeType,collects);

@override
String toString() {
  return 'AppEvent.configureWithContext(collects: $collects)';
}


}

/// @nodoc
abstract mixin class $ConfigureWithContextCopyWith<$Res> implements $AppEventCopyWith<$Res> {
  factory $ConfigureWithContextCopyWith(ConfigureWithContext value, $Res Function(ConfigureWithContext) _then) = _$ConfigureWithContextCopyWithImpl;
@useResult
$Res call({
 ContextCollects collects
});




}
/// @nodoc
class _$ConfigureWithContextCopyWithImpl<$Res>
    implements $ConfigureWithContextCopyWith<$Res> {
  _$ConfigureWithContextCopyWithImpl(this._self, this._then);

  final ConfigureWithContext _self;
  final $Res Function(ConfigureWithContext) _then;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? collects = null,}) {
  return _then(ConfigureWithContext(
null == collects ? _self.collects : collects // ignore: cast_nullable_to_non_nullable
as ContextCollects,
  ));
}


}

/// @nodoc


class RefreshFeatureFlag implements AppEvent {
  const RefreshFeatureFlag();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshFeatureFlag);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent.refreshFeatureFlag()';
}


}




/// @nodoc
mixin _$AppState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState()';
}


}

/// @nodoc
class $AppStateCopyWith<$Res>  {
$AppStateCopyWith(AppState _, $Res Function(AppState) __);
}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( InjectWithContext value)?  injectWithContext,TResult Function( _Completed value)?  completed,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case InjectWithContext() when injectWithContext != null:
return injectWithContext(_that);case _Completed() when completed != null:
return completed(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( InjectWithContext value)  injectWithContext,required TResult Function( _Completed value)  completed,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case InjectWithContext():
return injectWithContext(_that);case _Completed():
return completed(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( InjectWithContext value)?  injectWithContext,TResult? Function( _Completed value)?  completed,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case InjectWithContext() when injectWithContext != null:
return injectWithContext(_that);case _Completed() when completed != null:
return completed(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  injectWithContext,TResult Function( AppEntity entity)?  completed,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case InjectWithContext() when injectWithContext != null:
return injectWithContext();case _Completed() when completed != null:
return completed(_that.entity);case _Error() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  injectWithContext,required TResult Function( AppEntity entity)  completed,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case InjectWithContext():
return injectWithContext();case _Completed():
return completed(_that.entity);case _Error():
return error();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  injectWithContext,TResult? Function( AppEntity entity)?  completed,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case InjectWithContext() when injectWithContext != null:
return injectWithContext();case _Completed() when completed != null:
return completed(_that.entity);case _Error() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AppState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState.initial()';
}


}




/// @nodoc


class _Loading implements AppState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState.loading()';
}


}




/// @nodoc


class InjectWithContext implements AppState {
  const InjectWithContext();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InjectWithContext);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState.injectWithContext()';
}


}




/// @nodoc


class _Completed implements AppState {
  const _Completed(this.entity);
  

 final  AppEntity entity;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletedCopyWith<_Completed> get copyWith => __$CompletedCopyWithImpl<_Completed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Completed&&(identical(other.entity, entity) || other.entity == entity));
}


@override
int get hashCode => Object.hash(runtimeType,entity);

@override
String toString() {
  return 'AppState.completed(entity: $entity)';
}


}

/// @nodoc
abstract mixin class _$CompletedCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$CompletedCopyWith(_Completed value, $Res Function(_Completed) _then) = __$CompletedCopyWithImpl;
@useResult
$Res call({
 AppEntity entity
});




}
/// @nodoc
class __$CompletedCopyWithImpl<$Res>
    implements _$CompletedCopyWith<$Res> {
  __$CompletedCopyWithImpl(this._self, this._then);

  final _Completed _self;
  final $Res Function(_Completed) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entity = null,}) {
  return _then(_Completed(
null == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as AppEntity,
  ));
}


}

/// @nodoc


class _Error implements AppState {
  const _Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState.error()';
}


}




// dart format on
