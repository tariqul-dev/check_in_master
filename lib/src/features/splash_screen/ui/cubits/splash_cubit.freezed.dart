// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _InProgress value)?  inProgress,TResult Function( _LoggedIn value)?  loggedIn,TResult Function( _LoggedOut value)?  loggedOut,TResult Function( _Failure value)?  failure,TResult Function( _LocationDenied value)?  locationDenied,TResult Function( _LocationServiceDisabled value)?  locationServiceDisabled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _LoggedIn() when loggedIn != null:
return loggedIn(_that);case _LoggedOut() when loggedOut != null:
return loggedOut(_that);case _Failure() when failure != null:
return failure(_that);case _LocationDenied() when locationDenied != null:
return locationDenied(_that);case _LocationServiceDisabled() when locationServiceDisabled != null:
return locationServiceDisabled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _InProgress value)  inProgress,required TResult Function( _LoggedIn value)  loggedIn,required TResult Function( _LoggedOut value)  loggedOut,required TResult Function( _Failure value)  failure,required TResult Function( _LocationDenied value)  locationDenied,required TResult Function( _LocationServiceDisabled value)  locationServiceDisabled,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _InProgress():
return inProgress(_that);case _LoggedIn():
return loggedIn(_that);case _LoggedOut():
return loggedOut(_that);case _Failure():
return failure(_that);case _LocationDenied():
return locationDenied(_that);case _LocationServiceDisabled():
return locationServiceDisabled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _InProgress value)?  inProgress,TResult? Function( _LoggedIn value)?  loggedIn,TResult? Function( _LoggedOut value)?  loggedOut,TResult? Function( _Failure value)?  failure,TResult? Function( _LocationDenied value)?  locationDenied,TResult? Function( _LocationServiceDisabled value)?  locationServiceDisabled,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _LoggedIn() when loggedIn != null:
return loggedIn(_that);case _LoggedOut() when loggedOut != null:
return loggedOut(_that);case _Failure() when failure != null:
return failure(_that);case _LocationDenied() when locationDenied != null:
return locationDenied(_that);case _LocationServiceDisabled() when locationServiceDisabled != null:
return locationServiceDisabled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  inProgress,TResult Function( UserEntity userEntity)?  loggedIn,TResult Function()?  loggedOut,TResult Function( String message)?  failure,TResult Function()?  locationDenied,TResult Function()?  locationServiceDisabled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _InProgress() when inProgress != null:
return inProgress();case _LoggedIn() when loggedIn != null:
return loggedIn(_that.userEntity);case _LoggedOut() when loggedOut != null:
return loggedOut();case _Failure() when failure != null:
return failure(_that.message);case _LocationDenied() when locationDenied != null:
return locationDenied();case _LocationServiceDisabled() when locationServiceDisabled != null:
return locationServiceDisabled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  inProgress,required TResult Function( UserEntity userEntity)  loggedIn,required TResult Function()  loggedOut,required TResult Function( String message)  failure,required TResult Function()  locationDenied,required TResult Function()  locationServiceDisabled,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _InProgress():
return inProgress();case _LoggedIn():
return loggedIn(_that.userEntity);case _LoggedOut():
return loggedOut();case _Failure():
return failure(_that.message);case _LocationDenied():
return locationDenied();case _LocationServiceDisabled():
return locationServiceDisabled();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  inProgress,TResult? Function( UserEntity userEntity)?  loggedIn,TResult? Function()?  loggedOut,TResult? Function( String message)?  failure,TResult? Function()?  locationDenied,TResult? Function()?  locationServiceDisabled,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _InProgress() when inProgress != null:
return inProgress();case _LoggedIn() when loggedIn != null:
return loggedIn(_that.userEntity);case _LoggedOut() when loggedOut != null:
return loggedOut();case _Failure() when failure != null:
return failure(_that.message);case _LocationDenied() when locationDenied != null:
return locationDenied();case _LocationServiceDisabled() when locationServiceDisabled != null:
return locationServiceDisabled();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SplashState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.initial()';
}


}




/// @nodoc


class _InProgress implements SplashState {
  const _InProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.inProgress()';
}


}




/// @nodoc


class _LoggedIn implements SplashState {
  const _LoggedIn({required this.userEntity});
  

 final  UserEntity userEntity;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoggedInCopyWith<_LoggedIn> get copyWith => __$LoggedInCopyWithImpl<_LoggedIn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoggedIn&&(identical(other.userEntity, userEntity) || other.userEntity == userEntity));
}


@override
int get hashCode => Object.hash(runtimeType,userEntity);

@override
String toString() {
  return 'SplashState.loggedIn(userEntity: $userEntity)';
}


}

/// @nodoc
abstract mixin class _$LoggedInCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$LoggedInCopyWith(_LoggedIn value, $Res Function(_LoggedIn) _then) = __$LoggedInCopyWithImpl;
@useResult
$Res call({
 UserEntity userEntity
});




}
/// @nodoc
class __$LoggedInCopyWithImpl<$Res>
    implements _$LoggedInCopyWith<$Res> {
  __$LoggedInCopyWithImpl(this._self, this._then);

  final _LoggedIn _self;
  final $Res Function(_LoggedIn) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userEntity = null,}) {
  return _then(_LoggedIn(
userEntity: null == userEntity ? _self.userEntity : userEntity // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

/// @nodoc


class _LoggedOut implements SplashState {
  const _LoggedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoggedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.loggedOut()';
}


}




/// @nodoc


class _Failure implements SplashState {
  const _Failure({required this.message});
  

 final  String message;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SplashState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LocationDenied implements SplashState {
  const _LocationDenied();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationDenied);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.locationDenied()';
}


}




/// @nodoc


class _LocationServiceDisabled implements SplashState {
  const _LocationServiceDisabled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationServiceDisabled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.locationServiceDisabled()';
}


}




// dart format on
