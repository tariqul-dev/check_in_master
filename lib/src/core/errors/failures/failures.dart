import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.auth(String message) = AuthFailure;

  const factory Failure.location(String message) = LocationFailure;

  const factory Failure.creatingLocation(String message) =
      CreatingLocationFailure;

  const factory Failure.updateLocation(String message) = UpdateLocationFailure;

  const factory Failure.noDataFound(String message) = NoDataFoundFailure;

  const factory Failure.userNotFound(String message) = UserNotFoundFailure;

  const factory Failure.permission(String message) = PermissionFailure;

  const factory Failure.unknown(String message) = UnknownFailure;
}
