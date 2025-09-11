import 'package:bloc/bloc.dart';
import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/get_active_location_data.dart';
import 'package:check_in_master/src/features/location_management/domain/usecases/save_location_data.dart';
import 'package:check_in_master/src/features/location_management/domain/usecases/update_location_active_status_by_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

part 'location_operation_state.dart';

part 'location_operation_cubit.freezed.dart';

@Injectable()
class LocationOperationCubit extends Cubit<LocationOperationState> {
  final SaveLocationData _saveLocationData;
  final GetActiveLocationData _getActiveLocationData;
  final UpdateLocationActiveStatusById _updateLocationActiveStatusById;

  LocationOperationCubit(
    this._saveLocationData,
    this._getActiveLocationData,
    this._updateLocationActiveStatusById,
  ) : super(const LocationOperationState.initial());

  Future<void> saveLocationData({
    required LatLng locationData,
    required String locationName,
    required String? currentActiveLocationId,
  }) async {
    emit(LocationOperationState.inProgress());
    final locationDataEntity = LocationDataEntity(
      id: '',
      lat: locationData.latitude,
      lng: locationData.longitude,
      name: locationName,
      active: true,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );
    final result = await _saveLocationData(
      LocationInputEntity(
        locationDataEntity: locationDataEntity,
        currentActiveLocationId: currentActiveLocationId,
      ),
    );

    await result.fold(
      (l) async =>
          emit(LocationOperationState.saveLocationSuccess(newLocation: l)),
      (r) async => emit(LocationOperationState.failure(message: r.message)),
    );
  }

  Future<void> activeSavedLocation({
    required String currentActiveLocationId,
    required LocationDataEntity locationDataEntity,
  }) async {
    emit(LocationOperationState.inProgress());
    final result = await _updateLocationActiveStatusById(
      UpdateLocationActivationInput(
        currentActiveLocationId: currentActiveLocationId,
        updatableLocationEntity: locationDataEntity,
      ),
    );

    await result.fold(
      (l) async =>
          emit(LocationOperationState.saveLocationSuccess(newLocation: l)),
      (r) async => emit(LocationOperationState.failure(message: r.message)),
    );
  }

  Future<void> getLocationData() async {
    emit(LocationOperationState.inProgress());
    final result = await _getActiveLocationData(NoParams());

    await result.fold(
      (l) async {
        emit(LocationOperationState.fetchLocationData(locationData: l));
      },
      (r) async {
        emit(LocationOperationState.failure(message: r.message));
      },
    );
  }
}
