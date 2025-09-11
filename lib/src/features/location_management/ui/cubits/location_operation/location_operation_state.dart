part of 'location_operation_cubit.dart';

@freezed
class LocationOperationState with _$LocationOperationState {
  const factory LocationOperationState.initial() = _Initial;
  const factory LocationOperationState.inProgress() = _InProgress;

  const factory LocationOperationState.failure({required String message}) = _Failure;

  const factory LocationOperationState.fetchLocationData({
    required LocationDataEntity locationData,
  }) = _FetchLocationData;

  const factory LocationOperationState.saveLocationSuccess() = _SaveLocationSuccess;
}
