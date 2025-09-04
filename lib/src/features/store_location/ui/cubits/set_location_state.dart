part of 'set_location_cubit.dart';

@freezed
class SetLocationState with _$SetLocationState {
  const factory SetLocationState.initial({required LatLng locationData}) =
      _Initial;

  const factory SetLocationState.inProgress() = _InProgress;

  const factory SetLocationState.failure({required String message}) = _Failure;

  const factory SetLocationState.fetchLocationData({
    required LatLng locationData,
  }) = _FetchLocationData;

  const factory SetLocationState.saveLocationSuccess() = _SaveLocationSuccess;
}
