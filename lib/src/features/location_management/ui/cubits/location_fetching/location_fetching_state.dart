part of 'location_fetching_cubit.dart';

@freezed
class LocationFetchingState with _$LocationFetchingState {
  const factory LocationFetchingState.initial() = _Initial;

  const factory LocationFetchingState.inProgress() = _InProgress;

  const factory LocationFetchingState.failure({required String message}) =
      _Failure;

  const factory LocationFetchingState.fetchLocationData({
    required List<LocationDataEntity> locationsData,
  }) = _FetchLocationData;
}
