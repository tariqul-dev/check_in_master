part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.inProgress() = _InProgress;

  const factory HomeState.failure({required String message}) = _Failure;

  const factory HomeState.checkedIn({required UserEntity user}) = _CheckedIn;

  const factory HomeState.checkedOut({required UserEntity user}) = _CheckedOut;
}
