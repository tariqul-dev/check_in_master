// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_hud_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoadingHudState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingHudState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadingHudState()';
}


}

/// @nodoc
class $LoadingHudStateCopyWith<$Res>  {
$LoadingHudStateCopyWith(LoadingHudState _, $Res Function(LoadingHudState) __);
}


/// Adds pattern-matching-related methods to [LoadingHudState].
extension LoadingHudStatePatterns on LoadingHudState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _StartLoading value)?  startLoading,TResult Function( _CompleteLoading value)?  completeLoading,TResult Function( _ErrorMessage value)?  errorMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _StartLoading() when startLoading != null:
return startLoading(_that);case _CompleteLoading() when completeLoading != null:
return completeLoading(_that);case _ErrorMessage() when errorMessage != null:
return errorMessage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _StartLoading value)  startLoading,required TResult Function( _CompleteLoading value)  completeLoading,required TResult Function( _ErrorMessage value)  errorMessage,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _StartLoading():
return startLoading(_that);case _CompleteLoading():
return completeLoading(_that);case _ErrorMessage():
return errorMessage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _StartLoading value)?  startLoading,TResult? Function( _CompleteLoading value)?  completeLoading,TResult? Function( _ErrorMessage value)?  errorMessage,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _StartLoading() when startLoading != null:
return startLoading(_that);case _CompleteLoading() when completeLoading != null:
return completeLoading(_that);case _ErrorMessage() when errorMessage != null:
return errorMessage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  startLoading,TResult Function()?  completeLoading,TResult Function( String message)?  errorMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _StartLoading() when startLoading != null:
return startLoading();case _CompleteLoading() when completeLoading != null:
return completeLoading();case _ErrorMessage() when errorMessage != null:
return errorMessage(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  startLoading,required TResult Function()  completeLoading,required TResult Function( String message)  errorMessage,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _StartLoading():
return startLoading();case _CompleteLoading():
return completeLoading();case _ErrorMessage():
return errorMessage(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  startLoading,TResult? Function()?  completeLoading,TResult? Function( String message)?  errorMessage,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _StartLoading() when startLoading != null:
return startLoading();case _CompleteLoading() when completeLoading != null:
return completeLoading();case _ErrorMessage() when errorMessage != null:
return errorMessage(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LoadingHudState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadingHudState.initial()';
}


}




/// @nodoc


class _StartLoading implements LoadingHudState {
  const _StartLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadingHudState.startLoading()';
}


}




/// @nodoc


class _CompleteLoading implements LoadingHudState {
  const _CompleteLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompleteLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadingHudState.completeLoading()';
}


}




/// @nodoc


class _ErrorMessage implements LoadingHudState {
  const _ErrorMessage({required this.message});
  

 final  String message;

/// Create a copy of LoadingHudState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorMessageCopyWith<_ErrorMessage> get copyWith => __$ErrorMessageCopyWithImpl<_ErrorMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorMessage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoadingHudState.errorMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorMessageCopyWith<$Res> implements $LoadingHudStateCopyWith<$Res> {
  factory _$ErrorMessageCopyWith(_ErrorMessage value, $Res Function(_ErrorMessage) _then) = __$ErrorMessageCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorMessageCopyWithImpl<$Res>
    implements _$ErrorMessageCopyWith<$Res> {
  __$ErrorMessageCopyWithImpl(this._self, this._then);

  final _ErrorMessage _self;
  final $Res Function(_ErrorMessage) _then;

/// Create a copy of LoadingHudState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
