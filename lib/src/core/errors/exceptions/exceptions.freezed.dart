// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Exceptions {

 String get message;
/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExceptionsCopyWith<Exceptions> get copyWith => _$ExceptionsCopyWithImpl<Exceptions>(this as Exceptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Exceptions&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Exceptions(message: $message)';
}


}

/// @nodoc
abstract mixin class $ExceptionsCopyWith<$Res>  {
  factory $ExceptionsCopyWith(Exceptions value, $Res Function(Exceptions) _then) = _$ExceptionsCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ExceptionsCopyWithImpl<$Res>
    implements $ExceptionsCopyWith<$Res> {
  _$ExceptionsCopyWithImpl(this._self, this._then);

  final Exceptions _self;
  final $Res Function(Exceptions) _then;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Exceptions].
extension ExceptionsPatterns on Exceptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthException value)?  auth,TResult Function( LocationException value)?  location,TResult Function( CreatingLocationException value)?  creatingLocation,TResult Function( UpdateLocationException value)?  updateLocation,TResult Function( UserNotFoundException value)?  userNotFound,TResult Function( NoDataFoundException value)?  noDataFound,TResult Function( PermissionException value)?  permission,TResult Function( UnknownException value)?  unknown,TResult Function( CheckInException value)?  checkIn,TResult Function( CheckOutException value)?  checkOut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthException() when auth != null:
return auth(_that);case LocationException() when location != null:
return location(_that);case CreatingLocationException() when creatingLocation != null:
return creatingLocation(_that);case UpdateLocationException() when updateLocation != null:
return updateLocation(_that);case UserNotFoundException() when userNotFound != null:
return userNotFound(_that);case NoDataFoundException() when noDataFound != null:
return noDataFound(_that);case PermissionException() when permission != null:
return permission(_that);case UnknownException() when unknown != null:
return unknown(_that);case CheckInException() when checkIn != null:
return checkIn(_that);case CheckOutException() when checkOut != null:
return checkOut(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthException value)  auth,required TResult Function( LocationException value)  location,required TResult Function( CreatingLocationException value)  creatingLocation,required TResult Function( UpdateLocationException value)  updateLocation,required TResult Function( UserNotFoundException value)  userNotFound,required TResult Function( NoDataFoundException value)  noDataFound,required TResult Function( PermissionException value)  permission,required TResult Function( UnknownException value)  unknown,required TResult Function( CheckInException value)  checkIn,required TResult Function( CheckOutException value)  checkOut,}){
final _that = this;
switch (_that) {
case AuthException():
return auth(_that);case LocationException():
return location(_that);case CreatingLocationException():
return creatingLocation(_that);case UpdateLocationException():
return updateLocation(_that);case UserNotFoundException():
return userNotFound(_that);case NoDataFoundException():
return noDataFound(_that);case PermissionException():
return permission(_that);case UnknownException():
return unknown(_that);case CheckInException():
return checkIn(_that);case CheckOutException():
return checkOut(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthException value)?  auth,TResult? Function( LocationException value)?  location,TResult? Function( CreatingLocationException value)?  creatingLocation,TResult? Function( UpdateLocationException value)?  updateLocation,TResult? Function( UserNotFoundException value)?  userNotFound,TResult? Function( NoDataFoundException value)?  noDataFound,TResult? Function( PermissionException value)?  permission,TResult? Function( UnknownException value)?  unknown,TResult? Function( CheckInException value)?  checkIn,TResult? Function( CheckOutException value)?  checkOut,}){
final _that = this;
switch (_that) {
case AuthException() when auth != null:
return auth(_that);case LocationException() when location != null:
return location(_that);case CreatingLocationException() when creatingLocation != null:
return creatingLocation(_that);case UpdateLocationException() when updateLocation != null:
return updateLocation(_that);case UserNotFoundException() when userNotFound != null:
return userNotFound(_that);case NoDataFoundException() when noDataFound != null:
return noDataFound(_that);case PermissionException() when permission != null:
return permission(_that);case UnknownException() when unknown != null:
return unknown(_that);case CheckInException() when checkIn != null:
return checkIn(_that);case CheckOutException() when checkOut != null:
return checkOut(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  auth,TResult Function( String message)?  location,TResult Function( String message)?  creatingLocation,TResult Function( String message)?  updateLocation,TResult Function( String message)?  userNotFound,TResult Function( String message)?  noDataFound,TResult Function( String message)?  permission,TResult Function( String message)?  unknown,TResult Function( String message)?  checkIn,TResult Function( String message)?  checkOut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthException() when auth != null:
return auth(_that.message);case LocationException() when location != null:
return location(_that.message);case CreatingLocationException() when creatingLocation != null:
return creatingLocation(_that.message);case UpdateLocationException() when updateLocation != null:
return updateLocation(_that.message);case UserNotFoundException() when userNotFound != null:
return userNotFound(_that.message);case NoDataFoundException() when noDataFound != null:
return noDataFound(_that.message);case PermissionException() when permission != null:
return permission(_that.message);case UnknownException() when unknown != null:
return unknown(_that.message);case CheckInException() when checkIn != null:
return checkIn(_that.message);case CheckOutException() when checkOut != null:
return checkOut(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  auth,required TResult Function( String message)  location,required TResult Function( String message)  creatingLocation,required TResult Function( String message)  updateLocation,required TResult Function( String message)  userNotFound,required TResult Function( String message)  noDataFound,required TResult Function( String message)  permission,required TResult Function( String message)  unknown,required TResult Function( String message)  checkIn,required TResult Function( String message)  checkOut,}) {final _that = this;
switch (_that) {
case AuthException():
return auth(_that.message);case LocationException():
return location(_that.message);case CreatingLocationException():
return creatingLocation(_that.message);case UpdateLocationException():
return updateLocation(_that.message);case UserNotFoundException():
return userNotFound(_that.message);case NoDataFoundException():
return noDataFound(_that.message);case PermissionException():
return permission(_that.message);case UnknownException():
return unknown(_that.message);case CheckInException():
return checkIn(_that.message);case CheckOutException():
return checkOut(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  auth,TResult? Function( String message)?  location,TResult? Function( String message)?  creatingLocation,TResult? Function( String message)?  updateLocation,TResult? Function( String message)?  userNotFound,TResult? Function( String message)?  noDataFound,TResult? Function( String message)?  permission,TResult? Function( String message)?  unknown,TResult? Function( String message)?  checkIn,TResult? Function( String message)?  checkOut,}) {final _that = this;
switch (_that) {
case AuthException() when auth != null:
return auth(_that.message);case LocationException() when location != null:
return location(_that.message);case CreatingLocationException() when creatingLocation != null:
return creatingLocation(_that.message);case UpdateLocationException() when updateLocation != null:
return updateLocation(_that.message);case UserNotFoundException() when userNotFound != null:
return userNotFound(_that.message);case NoDataFoundException() when noDataFound != null:
return noDataFound(_that.message);case PermissionException() when permission != null:
return permission(_that.message);case UnknownException() when unknown != null:
return unknown(_that.message);case CheckInException() when checkIn != null:
return checkIn(_that.message);case CheckOutException() when checkOut != null:
return checkOut(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthException implements Exceptions {
  const AuthException(this.message);
  

@override final  String message;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthExceptionCopyWith<AuthException> get copyWith => _$AuthExceptionCopyWithImpl<AuthException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Exceptions.auth(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthExceptionCopyWith<$Res> implements $ExceptionsCopyWith<$Res> {
  factory $AuthExceptionCopyWith(AuthException value, $Res Function(AuthException) _then) = _$AuthExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthExceptionCopyWithImpl<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  _$AuthExceptionCopyWithImpl(this._self, this._then);

  final AuthException _self;
  final $Res Function(AuthException) _then;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LocationException implements Exceptions {
  const LocationException(this.message);
  

@override final  String message;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationExceptionCopyWith<LocationException> get copyWith => _$LocationExceptionCopyWithImpl<LocationException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Exceptions.location(message: $message)';
}


}

/// @nodoc
abstract mixin class $LocationExceptionCopyWith<$Res> implements $ExceptionsCopyWith<$Res> {
  factory $LocationExceptionCopyWith(LocationException value, $Res Function(LocationException) _then) = _$LocationExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LocationExceptionCopyWithImpl<$Res>
    implements $LocationExceptionCopyWith<$Res> {
  _$LocationExceptionCopyWithImpl(this._self, this._then);

  final LocationException _self;
  final $Res Function(LocationException) _then;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LocationException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreatingLocationException implements Exceptions {
  const CreatingLocationException(this.message);
  

@override final  String message;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatingLocationExceptionCopyWith<CreatingLocationException> get copyWith => _$CreatingLocationExceptionCopyWithImpl<CreatingLocationException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingLocationException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Exceptions.creatingLocation(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreatingLocationExceptionCopyWith<$Res> implements $ExceptionsCopyWith<$Res> {
  factory $CreatingLocationExceptionCopyWith(CreatingLocationException value, $Res Function(CreatingLocationException) _then) = _$CreatingLocationExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreatingLocationExceptionCopyWithImpl<$Res>
    implements $CreatingLocationExceptionCopyWith<$Res> {
  _$CreatingLocationExceptionCopyWithImpl(this._self, this._then);

  final CreatingLocationException _self;
  final $Res Function(CreatingLocationException) _then;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreatingLocationException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateLocationException implements Exceptions {
  const UpdateLocationException(this.message);
  

@override final  String message;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateLocationExceptionCopyWith<UpdateLocationException> get copyWith => _$UpdateLocationExceptionCopyWithImpl<UpdateLocationException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLocationException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Exceptions.updateLocation(message: $message)';
}


}

/// @nodoc
abstract mixin class $UpdateLocationExceptionCopyWith<$Res> implements $ExceptionsCopyWith<$Res> {
  factory $UpdateLocationExceptionCopyWith(UpdateLocationException value, $Res Function(UpdateLocationException) _then) = _$UpdateLocationExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UpdateLocationExceptionCopyWithImpl<$Res>
    implements $UpdateLocationExceptionCopyWith<$Res> {
  _$UpdateLocationExceptionCopyWithImpl(this._self, this._then);

  final UpdateLocationException _self;
  final $Res Function(UpdateLocationException) _then;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UpdateLocationException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserNotFoundException implements Exceptions {
  const UserNotFoundException(this.message);
  

@override final  String message;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserNotFoundExceptionCopyWith<UserNotFoundException> get copyWith => _$UserNotFoundExceptionCopyWithImpl<UserNotFoundException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserNotFoundException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Exceptions.userNotFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserNotFoundExceptionCopyWith<$Res> implements $ExceptionsCopyWith<$Res> {
  factory $UserNotFoundExceptionCopyWith(UserNotFoundException value, $Res Function(UserNotFoundException) _then) = _$UserNotFoundExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserNotFoundExceptionCopyWithImpl<$Res>
    implements $UserNotFoundExceptionCopyWith<$Res> {
  _$UserNotFoundExceptionCopyWithImpl(this._self, this._then);

  final UserNotFoundException _self;
  final $Res Function(UserNotFoundException) _then;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserNotFoundException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NoDataFoundException implements Exceptions {
  const NoDataFoundException(this.message);
  

@override final  String message;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoDataFoundExceptionCopyWith<NoDataFoundException> get copyWith => _$NoDataFoundExceptionCopyWithImpl<NoDataFoundException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoDataFoundException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Exceptions.noDataFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $NoDataFoundExceptionCopyWith<$Res> implements $ExceptionsCopyWith<$Res> {
  factory $NoDataFoundExceptionCopyWith(NoDataFoundException value, $Res Function(NoDataFoundException) _then) = _$NoDataFoundExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NoDataFoundExceptionCopyWithImpl<$Res>
    implements $NoDataFoundExceptionCopyWith<$Res> {
  _$NoDataFoundExceptionCopyWithImpl(this._self, this._then);

  final NoDataFoundException _self;
  final $Res Function(NoDataFoundException) _then;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NoDataFoundException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PermissionException implements Exceptions {
  const PermissionException(this.message);
  

@override final  String message;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionExceptionCopyWith<PermissionException> get copyWith => _$PermissionExceptionCopyWithImpl<PermissionException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Exceptions.permission(message: $message)';
}


}

/// @nodoc
abstract mixin class $PermissionExceptionCopyWith<$Res> implements $ExceptionsCopyWith<$Res> {
  factory $PermissionExceptionCopyWith(PermissionException value, $Res Function(PermissionException) _then) = _$PermissionExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PermissionExceptionCopyWithImpl<$Res>
    implements $PermissionExceptionCopyWith<$Res> {
  _$PermissionExceptionCopyWithImpl(this._self, this._then);

  final PermissionException _self;
  final $Res Function(PermissionException) _then;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PermissionException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnknownException implements Exceptions {
  const UnknownException(this.message);
  

@override final  String message;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownExceptionCopyWith<UnknownException> get copyWith => _$UnknownExceptionCopyWithImpl<UnknownException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Exceptions.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnknownExceptionCopyWith<$Res> implements $ExceptionsCopyWith<$Res> {
  factory $UnknownExceptionCopyWith(UnknownException value, $Res Function(UnknownException) _then) = _$UnknownExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnknownExceptionCopyWithImpl<$Res>
    implements $UnknownExceptionCopyWith<$Res> {
  _$UnknownExceptionCopyWithImpl(this._self, this._then);

  final UnknownException _self;
  final $Res Function(UnknownException) _then;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnknownException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CheckInException implements Exceptions {
  const CheckInException(this.message);
  

@override final  String message;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInExceptionCopyWith<CheckInException> get copyWith => _$CheckInExceptionCopyWithImpl<CheckInException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Exceptions.checkIn(message: $message)';
}


}

/// @nodoc
abstract mixin class $CheckInExceptionCopyWith<$Res> implements $ExceptionsCopyWith<$Res> {
  factory $CheckInExceptionCopyWith(CheckInException value, $Res Function(CheckInException) _then) = _$CheckInExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CheckInExceptionCopyWithImpl<$Res>
    implements $CheckInExceptionCopyWith<$Res> {
  _$CheckInExceptionCopyWithImpl(this._self, this._then);

  final CheckInException _self;
  final $Res Function(CheckInException) _then;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CheckInException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CheckOutException implements Exceptions {
  const CheckOutException(this.message);
  

@override final  String message;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckOutExceptionCopyWith<CheckOutException> get copyWith => _$CheckOutExceptionCopyWithImpl<CheckOutException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckOutException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Exceptions.checkOut(message: $message)';
}


}

/// @nodoc
abstract mixin class $CheckOutExceptionCopyWith<$Res> implements $ExceptionsCopyWith<$Res> {
  factory $CheckOutExceptionCopyWith(CheckOutException value, $Res Function(CheckOutException) _then) = _$CheckOutExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CheckOutExceptionCopyWithImpl<$Res>
    implements $CheckOutExceptionCopyWith<$Res> {
  _$CheckOutExceptionCopyWithImpl(this._self, this._then);

  final CheckOutException _self;
  final $Res Function(CheckOutException) _then;

/// Create a copy of Exceptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CheckOutException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
