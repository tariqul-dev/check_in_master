import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/login_input_entity.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

@Injectable()
class LoginWithEmailPassword
    implements BaseUseCase<LoginInputEntity, UserEntity> {
  final AuthRepository repository;

  LoginWithEmailPassword({required this.repository});

  @override
  AsyncResult<UserEntity> call(LoginInputEntity input) {
    return repository.loginWithEmailPassword(input);
  }
}
