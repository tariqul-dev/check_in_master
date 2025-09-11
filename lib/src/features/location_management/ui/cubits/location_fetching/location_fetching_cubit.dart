import 'package:bloc/bloc.dart';
import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/features/location_management/domain/usecases/get_locations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'location_fetching_state.dart';

part 'location_fetching_cubit.freezed.dart';

@injectable
class LocationFetchingCubit extends Cubit<LocationFetchingState> {
  final GetLocations _getLocations;

  LocationFetchingCubit(this._getLocations)
    : super(const LocationFetchingState.initial());

  Future<void> getLocations() async {
    emit(LocationFetchingState.inProgress());

    final result = await _getLocations(NoParams());
    await result.fold(
      (data) async =>
          emit(LocationFetchingState.fetchLocationData(locationsData: data)),
      (failure) async =>
          emit(LocationFetchingState.failure(message: failure.message)),
    );
  }
}
