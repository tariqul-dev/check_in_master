// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {

 String get message;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthFailure value)?  auth,TResult Function( LocationFailure value)?  location,TResult Function( CreatingLocationFailure value)?  creatingLocation,TResult Function( UpdateLocationFailure value)?  updateLocation,TResult Function( NoDataFoundFailure value)?  noDataFound,TResult Function( PermissionFailure value)?  permission,TResult Function( UnknownFailure value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthFailure() when auth != null:
return auth(_that);case LocationFailure() when location != null:
return location(_that);case CreatingLocationFailure() when creatingLocation != null:
return creatingLocation(_that);case UpdateLocationFailure() when updateLocation != null:
return updateLocation(_that);case NoDataFoundFailure() when noDataFound != null:
return noDataFound(_that);case PermissionFailure() when permission != null:
return permission(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthFailure value)  auth,required TResult Function( LocationFailure value)  location,required TResult Function( CreatingLocationFailure value)  creatingLocation,required TResult Function( UpdateLocationFailure value)  updateLocation,required TResult Function( NoDataFoundFailure value)  noDataFound,required TResult Function( PermissionFailure value)  permission,required TResult Function( UnknownFailure value)  unknown,}){
final _that = this;
switch (_that) {
case AuthFailure():
return auth(_that);case LocationFailure():
return location(_that);case CreatingLocationFailure():
return creatingLocation(_that);case UpdateLocationFailure():
return updateLocation(_that);case NoDataFoundFailure():
return noDataFound(_that);case PermissionFailure():
return permission(_that);case UnknownFailure():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthFailure value)?  auth,TResult? Function( LocationFailure value)?  location,TResult? Function( CreatingLocationFailure value)?  creatingLocation,TResult? Function( UpdateLocationFailure value)?  updateLocation,TResult? Function( NoDataFoundFailure value)?  noDataFound,TResult? Function( PermissionFailure value)?  permission,TResult? Function( UnknownFailure value)?  unknown,}){
final _that = this;
switch (_that) {
case AuthFailure() when auth != null:
return auth(_that);case LocationFailure() when location != null:
return location(_that);case CreatingLocationFailure() when creatingLocation != null:
return creatingLocation(_that);case UpdateLocationFailure() when updateLocation != null:
return updateLocation(_that);case NoDataFoundFailure() when noDataFound != null:
return noDataFound(_that);case PermissionFailure() when permission != null:
return permission(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  auth,TResult Function( String message)?  location,TResult Function( String message)?  creatingLocation,TResult Function( String message)?  updateLocation,TResult Function( String message)?  noDataFound,TResult Function( String message)?  permission,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthFailure() when auth != null:
return auth(_that.message);case LocationFailure() when location != null:
return location(_that.message);case CreatingLocationFailure() when creatingLocation != null:
return creatingLocation(_that.message);case UpdateLocationFailure() when updateLocation != null:
return updateLocation(_that.message);case NoDataFoundFailure() when noDataFound != null:
return noDataFound(_that.message);case PermissionFailure() when permission != null:
return permission(_that.message);case UnknownFailure() when unknown != null:
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  auth,required TResult Function( String message)  location,required TResult Function( String message)  creatingLocation,required TResult Function( String message)  updateLocation,required TResult Function( String message)  noDataFound,required TResult Function( String message)  permission,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case AuthFailure():
return auth(_that.message);case LocationFailure():
return location(_that.message);case CreatingLocationFailure():
return creatingLocation(_that.message);case UpdateLocationFailure():
return updateLocation(_that.message);case NoDataFoundFailure():
return noDataFound(_that.message);case PermissionFailure():
return permission(_that.message);case UnknownFailure():
return unknown(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  auth,TResult? Function( String message)?  location,TResult? Function( String message)?  creatingLocation,TResult? Function( String message)?  updateLocation,TResult? Function( String message)?  noDataFound,TResult? Function( String message)?  permission,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case AuthFailure() when auth != null:
return auth(_that.message);case LocationFailure() when location != null:
return location(_that.message);case CreatingLocationFailure() when creatingLocation != null:
return creatingLocation(_that.message);case UpdateLocationFailure() when updateLocation != null:
return updateLocation(_that.message);case NoDataFoundFailure() when noDataFound != null:
return noDataFound(_that.message);case PermissionFailure() when permission != null:
return permission(_that.message);case UnknownFailure() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthFailure implements Failure {
  const AuthFailure(this.message);
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.auth(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LocationFailure implements Failure {
  const LocationFailure(this.message);
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationFailureCopyWith<LocationFailure> get copyWith => _$LocationFailureCopyWithImpl<LocationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.location(message: $message)';
}


}

/// @nodoc
abstract mixin class $LocationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $LocationFailureCopyWith(LocationFailure value, $Res Function(LocationFailure) _then) = _$LocationFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LocationFailureCopyWithImpl<$Res>
    implements $LocationFailureCopyWith<$Res> {
  _$LocationFailureCopyWithImpl(this._self, this._then);

  final LocationFailure _self;
  final $Res Function(LocationFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LocationFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreatingLocationFailure implements Failure {
  const CreatingLocationFailure(this.message);
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatingLocationFailureCopyWith<CreatingLocationFailure> get copyWith => _$CreatingLocationFailureCopyWithImpl<CreatingLocationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingLocationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.creatingLocation(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreatingLocationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $CreatingLocationFailureCopyWith(CreatingLocationFailure value, $Res Function(CreatingLocationFailure) _then) = _$CreatingLocationFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreatingLocationFailureCopyWithImpl<$Res>
    implements $CreatingLocationFailureCopyWith<$Res> {
  _$CreatingLocationFailureCopyWithImpl(this._self, this._then);

  final CreatingLocationFailure _self;
  final $Res Function(CreatingLocationFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreatingLocationFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateLocationFailure implements Failure {
  const UpdateLocationFailure(this.message);
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateLocationFailureCopyWith<UpdateLocationFailure> get copyWith => _$UpdateLocationFailureCopyWithImpl<UpdateLocationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLocationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.updateLocation(message: $message)';
}


}

/// @nodoc
abstract mixin class $UpdateLocationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UpdateLocationFailureCopyWith(UpdateLocationFailure value, $Res Function(UpdateLocationFailure) _then) = _$UpdateLocationFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UpdateLocationFailureCopyWithImpl<$Res>
    implements $UpdateLocationFailureCopyWith<$Res> {
  _$UpdateLocationFailureCopyWithImpl(this._self, this._then);

  final UpdateLocationFailure _self;
  final $Res Function(UpdateLocationFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UpdateLocationFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NoDataFoundFailure implements Failure {
  const NoDataFoundFailure(this.message);
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoDataFoundFailureCopyWith<NoDataFoundFailure> get copyWith => _$NoDataFoundFailureCopyWithImpl<NoDataFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoDataFoundFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.noDataFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $NoDataFoundFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NoDataFoundFailureCopyWith(NoDataFoundFailure value, $Res Function(NoDataFoundFailure) _then) = _$NoDataFoundFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NoDataFoundFailureCopyWithImpl<$Res>
    implements $NoDataFoundFailureCopyWith<$Res> {
  _$NoDataFoundFailureCopyWithImpl(this._self, this._then);

  final NoDataFoundFailure _self;
  final $Res Function(NoDataFoundFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NoDataFoundFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PermissionFailure implements Failure {
  const PermissionFailure(this.message);
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionFailureCopyWith<PermissionFailure> get copyWith => _$PermissionFailureCopyWithImpl<PermissionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.permission(message: $message)';
}


}

/// @nodoc
abstract mixin class $PermissionFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $PermissionFailureCopyWith(PermissionFailure value, $Res Function(PermissionFailure) _then) = _$PermissionFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PermissionFailureCopyWithImpl<$Res>
    implements $PermissionFailureCopyWith<$Res> {
  _$PermissionFailureCopyWithImpl(this._self, this._then);

  final PermissionFailure _self;
  final $Res Function(PermissionFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PermissionFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnknownFailure implements Failure {
  const UnknownFailure(this.message);
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownFailureCopyWith<UnknownFailure> get copyWith => _$UnknownFailureCopyWithImpl<UnknownFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnknownFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnknownFailureCopyWith(UnknownFailure value, $Res Function(UnknownFailure) _then) = _$UnknownFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnknownFailureCopyWithImpl<$Res>
    implements $UnknownFailureCopyWith<$Res> {
  _$UnknownFailureCopyWithImpl(this._self, this._then);

  final UnknownFailure _self;
  final $Res Function(UnknownFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnknownFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
