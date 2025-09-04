// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_out_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckInOutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInOutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckInOutState()';
}


}

/// @nodoc
class $CheckInOutStateCopyWith<$Res>  {
$CheckInOutStateCopyWith(CheckInOutState _, $Res Function(CheckInOutState) __);
}


/// Adds pattern-matching-related methods to [CheckInOutState].
extension CheckInOutStatePatterns on CheckInOutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Failure value)?  failure,TResult Function( _CheckedIn value)?  checkedIn,TResult Function( _CheckedOut value)?  checkedOut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Failure() when failure != null:
return failure(_that);case _CheckedIn() when checkedIn != null:
return checkedIn(_that);case _CheckedOut() when checkedOut != null:
return checkedOut(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Failure value)  failure,required TResult Function( _CheckedIn value)  checkedIn,required TResult Function( _CheckedOut value)  checkedOut,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Failure():
return failure(_that);case _CheckedIn():
return checkedIn(_that);case _CheckedOut():
return checkedOut(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Failure value)?  failure,TResult? Function( _CheckedIn value)?  checkedIn,TResult? Function( _CheckedOut value)?  checkedOut,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Failure() when failure != null:
return failure(_that);case _CheckedIn() when checkedIn != null:
return checkedIn(_that);case _CheckedOut() when checkedOut != null:
return checkedOut(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  failure,TResult Function()?  checkedIn,TResult Function()?  checkedOut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Failure() when failure != null:
return failure(_that.message);case _CheckedIn() when checkedIn != null:
return checkedIn();case _CheckedOut() when checkedOut != null:
return checkedOut();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  failure,required TResult Function()  checkedIn,required TResult Function()  checkedOut,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Failure():
return failure(_that.message);case _CheckedIn():
return checkedIn();case _CheckedOut():
return checkedOut();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  failure,TResult? Function()?  checkedIn,TResult? Function()?  checkedOut,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Failure() when failure != null:
return failure(_that.message);case _CheckedIn() when checkedIn != null:
return checkedIn();case _CheckedOut() when checkedOut != null:
return checkedOut();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CheckInOutState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckInOutState.initial()';
}


}




/// @nodoc


class _Loading implements CheckInOutState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckInOutState.loading()';
}


}




/// @nodoc


class _Failure implements CheckInOutState {
  const _Failure({required this.message});
  

 final  String message;

/// Create a copy of CheckInOutState
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
  return 'CheckInOutState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $CheckInOutStateCopyWith<$Res> {
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

/// Create a copy of CheckInOutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CheckedIn implements CheckInOutState {
  const _CheckedIn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckedIn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckInOutState.checkedIn()';
}


}




/// @nodoc


class _CheckedOut implements CheckInOutState {
  const _CheckedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckInOutState.checkedOut()';
}


}




// dart format on
