import 'package:bloc/bloc.dart';
import 'package:check_in_master/src/core/errors/failures/failures.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/get_current_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

@Injectable()
class SplashCubit extends Cubit<SplashState> {
  final GetCurrentUser _getCurrentUser;

  SplashCubit(this._getCurrentUser) : super(const SplashState.initial());

  Future<void> checkLoginStatus() async {
    emit(SplashState.inProgress());

    final result = await _getCurrentUser(NoParams());

    await result.fold((l) async => emit(SplashState.loggedIn()), (r) async {
      if (r is UserNotFoundFailure) {
        emit(SplashState.loggedOut());
        return;
      }
      emit(SplashState.failure(message: r.message));
    });
  }
}
