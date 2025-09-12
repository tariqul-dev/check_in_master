part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;

  const factory SplashState.inProgress() = _InProgress;

  const factory SplashState.loggedIn() = _LoggedIn;

  const factory SplashState.loggedOut() = _LoggedOut;

  const factory SplashState.failure({required String message}) = _Failure;
}
