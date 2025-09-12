import 'package:injectable/injectable.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';
import '../entities/user_entity.dart';
import '../params/no_params.dart';
import 'typedefs.dart';
import 'usecase.dart';

@Injectable()
class GetCurrentUser implements BaseUseCase<NoParams, UserEntity> {
  final AuthRepository repository;

  GetCurrentUser({required this.repository});

  @override
  AsyncResult<UserEntity> call(NoParams input) {
    return repository.getCurrentUser();
  }
}
