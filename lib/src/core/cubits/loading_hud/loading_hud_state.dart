part of 'loading_hud_cubit.dart';

@freezed
class LoadingHudState with _$LoadingHudState {
  const factory LoadingHudState.initial() = _Initial;

  const factory LoadingHudState.startLoading() = _StartLoading;

  const factory LoadingHudState.completeLoading() = _CompleteLoading;

  const factory LoadingHudState.errorMessage({required String message}) = _ErrorMessage;
}
