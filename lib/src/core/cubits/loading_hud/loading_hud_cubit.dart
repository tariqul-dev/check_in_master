import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'loading_hud_state.dart';

part 'loading_hud_cubit.freezed.dart';

@Injectable()
class LoadingHudCubit extends Cubit<LoadingHudState> {
  LoadingHudCubit() : super(const LoadingHudState.initial());

  void startLoading() {
    emit(LoadingHudState.startLoading());
  }

  void completeLoading() {
    emit(LoadingHudState.completeLoading());
  }

  void errorMessage(String message) {
    emit(LoadingHudState.errorMessage(message: message));
  }
}
