import 'package:bloc/bloc.dart';
import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/get_active_location_data.dart';
import 'package:check_in_master/src/features/store_location/domain/usecases/save_location_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

part 'set_location_state.dart';

part 'set_location_cubit.freezed.dart';

@Injectable()
class SetLocationCubit extends Cubit<SetLocationState> {
  final SaveLocationData _saveLocationData;
  final GetActiveLocationData _getLocationData;

  SetLocationCubit(this._saveLocationData, this._getLocationData)
    : super(const SetLocationState.initial());

  Future<void> saveLocationData({
    required LatLng locationData,
    required String locationName,
    required String? currentActiveLocationId,
  }) async {
    emit(SetLocationState.inProgress());
    final locationDataEntity = LocationDataEntity(
      id: DateTime.now().toString() + Uuid().v4(),
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
      (l) async => emit(SetLocationState.saveLocationSuccess()),
      (r) async => emit(SetLocationState.failure(message: r.message)),
    );
  }

  Future<void> getLocationData() async {
    emit(SetLocationState.inProgress());
    final result = await _getLocationData(NoParams());

    await result.fold(
      (l) async {
        emit(SetLocationState.fetchLocationData(locationData: l));
      },
      (r) async {
        emit(SetLocationState.failure(message: r.message));
      },
    );
  }
}
