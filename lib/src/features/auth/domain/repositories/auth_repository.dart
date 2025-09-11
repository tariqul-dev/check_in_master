import 'package:check_in_master/src/core/usecases/typedefs.dart';

import '../entities/login_input_entity.dart';
import '../entities/register_input_entity.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  AsyncResult<UserEntity> loginWithEmailPassword(LoginInputEntity loginInput);

  AsyncResult<UserEntity> registerWithEmailPassword(
    RegisterInputEntity registerInput,
  );

  AsyncResult<UserEntity> getCurrentUser();

  AsyncResult<bool> logout();
}
