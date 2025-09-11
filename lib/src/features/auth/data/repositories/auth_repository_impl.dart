import 'package:check_in_master/src/core/errors/failures/failures.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart';
import 'package:check_in_master/src/features/auth/data/models/login_input_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/login_input_entity.dart';
import '../../domain/entities/register_input_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

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
  ) {
    // TODO: implement registerWithEmailPassword
    throw UnimplementedError();
  }

  @override
  AsyncResult<UserEntity> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  AsyncResult<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
