import 'package:bloc/bloc.dart';
import 'package:check_in_master/src/core/errors/failures/failures.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/get_current_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

@Injectable()
class SplashCubit extends Cubit<SplashState> {
  final GetCurrentUser _getCurrentUser;

  SplashCubit(this._getCurrentUser) : super(const SplashState.initial());

  Future<void> checkLoginStatus() async {
    emit(SplashState.inProgress());
    if (!await _handleLocationPermission()) return;

    final result = await _getCurrentUser(NoParams());

    await result.fold((l) async => emit(SplashState.loggedIn()), (r) async {
      if (r is UserNotFoundFailure) {
        emit(SplashState.loggedOut());
        return;
      }
      emit(SplashState.failure(message: r.message));
    });
  }

  Future<bool> _handleLocationPermission() async {
    final location = Location();

    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      final enabled = await location.requestService();
      if (!enabled) {
        emit(const SplashState.locationServiceDisabled());
        return false;
      }
    }

    final status = await Permission.location.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      final request = await Permission.location.request();
      if (!request.isGranted) {
        emit(const SplashState.locationDenied());
        return false;
      }
    }

    return true;
  }
}
