import 'package:bloc/bloc.dart';
import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/get_active_location_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'active_location_cubit.freezed.dart';
part 'active_location_state.dart';

@injectable
class ActiveLocationCubit extends Cubit<ActiveLocationState> {
  final GetActiveLocationData _getActiveLocationData;

  ActiveLocationCubit(this._getActiveLocationData)
    : super(const ActiveLocationState.initial());

  Future<void> getActiveLocation() async {
    emit(ActiveLocationState.inProgress());

    final result = await _getActiveLocationData(NoParams());
    await result.fold(
      (l) async => emit(ActiveLocationState.success(location: l)),
      (r) async => emit(ActiveLocationState.failure(message: r.message)),
    );
  }
}
