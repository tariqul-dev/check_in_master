part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.inProgress() = _InProgress;

  const factory AuthState.loggedOut() = _LoggedOut;
  const factory AuthState.loggedIn({required UserEntity userEntity}) = _LoggedIn;

  const factory AuthState.failure({required String message}) = _Failure;

  const factory AuthState.success({required UserEntity userEntity}) = _Success;
}
