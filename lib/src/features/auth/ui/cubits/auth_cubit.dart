import 'package:bloc/bloc.dart';
import 'package:check_in_master/src/core/errors/failures/failures.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/features/auth/domain/entities/login_input_entity.dart';
import 'package:check_in_master/src/features/auth/domain/entities/register_input_entity.dart';
import 'package:check_in_master/src/core/usecases/get_current_user.dart';
import 'package:check_in_master/src/features/auth/domain/usecases/login_with_email_password.dart';
import 'package:check_in_master/src/core/usecases/logout.dart';
import 'package:check_in_master/src/features/auth/domain/usecases/register_with_email_password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUser _getCurrentUser;
  final LoginWithEmailPassword _loginWithEmailPassword;
  final RegisterWithEmailPassword _registerWithEmailPassword;
  final Logout _logout;

  AuthCubit(
    this._getCurrentUser,
    this._loginWithEmailPassword,
    this._registerWithEmailPassword,
    this._logout,
  ) : super(const AuthState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthState.inProgress());
    final loginInput = LoginInputEntity(email: email, password: password);
    final result = await _loginWithEmailPassword(loginInput);

    await result.fold(
      (l) async => emit(AuthState.success(userEntity: l)),
      (r) async => emit(AuthState.failure(message: r.message)),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthState.inProgress());
    final registerInput = RegisterInputEntity(
      email: email,
      password: password,
      name: name,
    );
    final result = await _registerWithEmailPassword(registerInput);

    await result.fold(
      (l) async => emit(AuthState.success(userEntity: l)),
      (r) async => emit(AuthState.failure(message: r.message)),
    );
  }

  Future<void> getCurrentUser() async {
    emit(AuthState.inProgress());

    final result = await _getCurrentUser(NoParams());

    await result.fold((l) async => emit(AuthState.success(userEntity: l)), (
      r,
    ) async {
      if (r is UserNotFoundFailure) {
        emit(AuthState.loggedOut());
        return;
      }
      emit(AuthState.failure(message: r.message));
    });
  }

  Future<void> logout() async {
    emit(AuthState.inProgress());

    final result = await _logout(NoParams());

    await result.fold(
      (l) async => emit(AuthState.loggedOut()),
      (r) async => emit(AuthState.failure(message: r.message)),
    );
  }
}
