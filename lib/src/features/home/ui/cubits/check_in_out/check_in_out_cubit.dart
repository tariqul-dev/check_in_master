import 'package:bloc/bloc.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/get_location_data.dart';
import 'package:check_in_master/src/features/home/domain/usecases/check_eligibility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

part 'check_in_out_state.dart';

part 'check_in_out_cubit.freezed.dart';

@Injectable()
class CheckInOutCubit extends Cubit<CheckInOutState> {
  final GetLocationData _getLocationData;
  final CheckEligibility _checkEligibility;

  CheckInOutCubit(this._getLocationData, this._checkEligibility)
    : super(const CheckInOutState.initial());

  Future<void> checkIn() async {
    emit(CheckInOutState.loading());
    final result = await _getLocationData(NoParams());
    await result.fold(
      (success) async {
        final eligibilityResult = await _checkEligibility(success);

        await eligibilityResult.fold(
          (l) async => emit(CheckInOutState.checkedIn()),
          (r) async => emit(CheckInOutState.failure(message: r.message)),
        );
      },
      (failure) async {
        emit(CheckInOutState.failure(message: failure.message));
      },
    );
  }

  Future<void> checkOut() async {
    emit(CheckInOutState.loading());
    await Future.delayed(Duration(seconds: 1));
    emit(CheckInOutState.checkedOut());
  }
}
