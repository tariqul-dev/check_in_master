import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/register_input_entity.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

@Injectable()
class RegisterWithEmailPassword
    implements BaseUseCase<RegisterInputEntity, UserEntity> {
  final AuthRepository repository;

  RegisterWithEmailPassword({required this.repository});

  @override
  AsyncResult<UserEntity> call(RegisterInputEntity input) {
    return repository.registerWithEmailPassword(input);
  }
}
