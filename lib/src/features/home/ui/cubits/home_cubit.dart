import 'package:bloc/bloc.dart';
import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/do_check_in.dart';
import '../../domain/usecases/do_check_out.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  final DoCheckIn _doCheckIn;
  final DoCheckOut _doCheckOut;

  HomeCubit(this._doCheckIn, this._doCheckOut)
    : super(const HomeState.initial());

  void getCheckInStatus({required UserEntity user}) {
    emit(HomeState.inProgress());
    if (user.isCheckedIn && user.checkInDateTime != null) {
      emit(HomeState.checkedIn(user: user));
      return;
    }
    emit(HomeState.checkedOut(user: user));
  }

  Future<void> performCheckIn({
    required UserEntity user,
    required LocationDataEntity activeLocation,
  }) async {
    emit(HomeState.inProgress());
    final result = await _doCheckIn(
      CheckInOutInput(user: user, activeLocation: activeLocation),
    );

    await result.fold(
      (l) async => emit(HomeState.checkedIn(user: l)),
      (r) async => emit(HomeState.failure(message: r.message)),
    );
  }

  Future<void> performCheckOut({
    required UserEntity user,
    required LocationDataEntity activeLocation,
  }) async {
    emit(HomeState.inProgress());
    final result = await _doCheckOut(
      CheckInOutInput(user: user, activeLocation: activeLocation),
    );

    await result.fold(
      (l) async => emit(HomeState.checkedOut(user: l)),
      (r) async => emit(HomeState.failure(message: r.message)),
    );
  }
}
