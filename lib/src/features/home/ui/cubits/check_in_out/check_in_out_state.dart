part of 'check_in_out_cubit.dart';

@freezed
class CheckInOutState with _$CheckInOutState {
  const factory CheckInOutState.initial() = _Initial;

  const factory CheckInOutState.loading() = _Loading;

  const factory CheckInOutState.failure({required String message}) = _Failure;

  const factory CheckInOutState.checkedIn() = _CheckedIn;

  const factory CheckInOutState.checkedOut() = _CheckedOut;
}
