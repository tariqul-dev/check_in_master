import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';

@Injectable()
class Logout implements BaseUseCase<NoParams, bool> {
  final AuthRepository repository;

  Logout({required this.repository});

  @override
  AsyncResult<bool> call(NoParams input) {
    return repository.logout();
  }
}
