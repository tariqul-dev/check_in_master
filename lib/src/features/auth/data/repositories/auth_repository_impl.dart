import 'package:check_in_master/src/core/entities/user_entity.dart';
import 'package:check_in_master/src/core/errors/exceptions/exceptions.dart';
import 'package:check_in_master/src/core/errors/failures/failures.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/login_input_entity.dart';
import '../../domain/entities/register_input_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote_datasource/auth_remote_datasource.dart';
import '../models/login_input_model.dart';
import '../models/register_input_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  AsyncResult<UserEntity> loginWithEmailPassword(
    LoginInputEntity loginInput,
  ) async {
    try {
      final loggedInUser = await authRemoteDataSource.login(
        LoginInputModel.fromEntity(loginInput),
      );
      return Left(loggedInUser.toEntity());
    } catch (e) {
      return Right(AuthFailure(e.toString()));
    }
  }

  @override
  AsyncResult<UserEntity> registerWithEmailPassword(
    RegisterInputEntity registerInput,
  ) async {
    try {
      final registeredUser = await authRemoteDataSource.register(
        RegisterInputModel.fromEntity(registerInput),
      );
      return Left(registeredUser.toEntity());
    } catch (e) {
      return Right(AuthFailure(e.toString()));
    }
  }

  @override
  AsyncResult<UserEntity> getCurrentUser() async {
    try {
      final currentUser = await authRemoteDataSource.getCurrentUser();
      if (currentUser == null) throw UserNotFoundException('User not found');
      return Left(currentUser.toEntity());
    } on UserNotFoundException catch (e) {
      return Right(UserNotFoundFailure(e.message));
    } catch (e) {
      return Right(AuthFailure(e.toString()));
    }
  }

  @override
  AsyncResult<bool> logout() async {
    try {
      final isLogout = await authRemoteDataSource.logout();
      return Left(isLogout);
    } catch (e) {
      return Right(AuthFailure(e.toString()));
    }
  }
}
