import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

@Injectable()
class GetCurrentUser implements BaseUseCase<NoParams, UserEntity> {
  final AuthRepository repository;

  GetCurrentUser({required this.repository});

  @override
  AsyncResult<UserEntity> call(NoParams input) {
    return repository.getCurrentUser();
  }
}
