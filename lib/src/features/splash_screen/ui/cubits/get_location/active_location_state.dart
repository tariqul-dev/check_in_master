part of 'active_location_cubit.dart';

@freezed
class ActiveLocationState with _$ActiveLocationState {
  const factory ActiveLocationState.initial() = _Initial;

  const factory ActiveLocationState.inProgress() = _InProgress;

  const factory ActiveLocationState.success({required LocationDataEntity location}) =
      _Success;

  const factory ActiveLocationState.failure({required String message}) =
      _Failure;
}
