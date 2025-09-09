// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_location_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SetLocationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetLocationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SetLocationState()';
}


}

/// @nodoc
class $SetLocationStateCopyWith<$Res>  {
$SetLocationStateCopyWith(SetLocationState _, $Res Function(SetLocationState) __);
}


/// Adds pattern-matching-related methods to [SetLocationState].
extension SetLocationStatePatterns on SetLocationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _InProgress value)?  inProgress,TResult Function( _Failure value)?  failure,TResult Function( _FetchLocationData value)?  fetchLocationData,TResult Function( _SaveLocationSuccess value)?  saveLocationSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Failure() when failure != null:
return failure(_that);case _FetchLocationData() when fetchLocationData != null:
return fetchLocationData(_that);case _SaveLocationSuccess() when saveLocationSuccess != null:
return saveLocationSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _InProgress value)  inProgress,required TResult Function( _Failure value)  failure,required TResult Function( _FetchLocationData value)  fetchLocationData,required TResult Function( _SaveLocationSuccess value)  saveLocationSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _InProgress():
return inProgress(_that);case _Failure():
return failure(_that);case _FetchLocationData():
return fetchLocationData(_that);case _SaveLocationSuccess():
return saveLocationSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _InProgress value)?  inProgress,TResult? Function( _Failure value)?  failure,TResult? Function( _FetchLocationData value)?  fetchLocationData,TResult? Function( _SaveLocationSuccess value)?  saveLocationSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Failure() when failure != null:
return failure(_that);case _FetchLocationData() when fetchLocationData != null:
return fetchLocationData(_that);case _SaveLocationSuccess() when saveLocationSuccess != null:
return saveLocationSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  inProgress,TResult Function( String message)?  failure,TResult Function( LocationDataEntity locationData)?  fetchLocationData,TResult Function()?  saveLocationSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _InProgress() when inProgress != null:
return inProgress();case _Failure() when failure != null:
return failure(_that.message);case _FetchLocationData() when fetchLocationData != null:
return fetchLocationData(_that.locationData);case _SaveLocationSuccess() when saveLocationSuccess != null:
return saveLocationSuccess();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  inProgress,required TResult Function( String message)  failure,required TResult Function( LocationDataEntity locationData)  fetchLocationData,required TResult Function()  saveLocationSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _InProgress():
return inProgress();case _Failure():
return failure(_that.message);case _FetchLocationData():
return fetchLocationData(_that.locationData);case _SaveLocationSuccess():
return saveLocationSuccess();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  inProgress,TResult? Function( String message)?  failure,TResult? Function( LocationDataEntity locationData)?  fetchLocationData,TResult? Function()?  saveLocationSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _InProgress() when inProgress != null:
return inProgress();case _Failure() when failure != null:
return failure(_that.message);case _FetchLocationData() when fetchLocationData != null:
return fetchLocationData(_that.locationData);case _SaveLocationSuccess() when saveLocationSuccess != null:
return saveLocationSuccess();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SetLocationState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SetLocationState.initial()';
}


}




/// @nodoc


class _InProgress implements SetLocationState {
  const _InProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SetLocationState.inProgress()';
}


}




/// @nodoc


class _Failure implements SetLocationState {
  const _Failure({required this.message});
  

 final  String message;

/// Create a copy of SetLocationState
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
  return 'SetLocationState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $SetLocationStateCopyWith<$Res> {
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

/// Create a copy of SetLocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FetchLocationData implements SetLocationState {
  const _FetchLocationData({required this.locationData});
  

 final  LocationDataEntity locationData;

/// Create a copy of SetLocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchLocationDataCopyWith<_FetchLocationData> get copyWith => __$FetchLocationDataCopyWithImpl<_FetchLocationData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchLocationData&&(identical(other.locationData, locationData) || other.locationData == locationData));
}


@override
int get hashCode => Object.hash(runtimeType,locationData);

@override
String toString() {
  return 'SetLocationState.fetchLocationData(locationData: $locationData)';
}


}

/// @nodoc
abstract mixin class _$FetchLocationDataCopyWith<$Res> implements $SetLocationStateCopyWith<$Res> {
  factory _$FetchLocationDataCopyWith(_FetchLocationData value, $Res Function(_FetchLocationData) _then) = __$FetchLocationDataCopyWithImpl;
@useResult
$Res call({
 LocationDataEntity locationData
});




}
/// @nodoc
class __$FetchLocationDataCopyWithImpl<$Res>
    implements _$FetchLocationDataCopyWith<$Res> {
  __$FetchLocationDataCopyWithImpl(this._self, this._then);

  final _FetchLocationData _self;
  final $Res Function(_FetchLocationData) _then;

/// Create a copy of SetLocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locationData = null,}) {
  return _then(_FetchLocationData(
locationData: null == locationData ? _self.locationData : locationData // ignore: cast_nullable_to_non_nullable
as LocationDataEntity,
  ));
}


}

/// @nodoc


class _SaveLocationSuccess implements SetLocationState {
  const _SaveLocationSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveLocationSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SetLocationState.saveLocationSuccess()';
}


}




// dart format on
