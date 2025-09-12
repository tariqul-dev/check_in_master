part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;

  const factory SplashState.inProgress() = _InProgress;

  const factory SplashState.loggedIn({required UserEntity userEntity}) =
      _LoggedIn;

  const factory SplashState.loggedOut() = _LoggedOut;

  const factory SplashState.failure({required String message}) = _Failure;

  const factory SplashState.locationDenied() = _LocationDenied;

  const factory SplashState.locationServiceDisabled() =
      _LocationServiceDisabled;
}
