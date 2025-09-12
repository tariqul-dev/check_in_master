import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
sealed class Exceptions with _$Exceptions implements Exception {
  const factory Exceptions.auth(String message) = AuthException;

  const factory Exceptions.location(String message) = LocationException;

  const factory Exceptions.creatingLocation(String message) =
      CreatingLocationException;

  const factory Exceptions.updateLocation(String message) =
      UpdateLocationException;

  const factory Exceptions.userNotFound(String message) = UserNotFoundException;

  const factory Exceptions.noDataFound(String message) = NoDataFoundException;

  const factory Exceptions.permission(String message) = PermissionException;

  const factory Exceptions.unknown(String message) = UnknownException;

  const factory Exceptions.checkIn(String message) = CheckInException;

  const factory Exceptions.checkOut(String message) = CheckOutException;
}
