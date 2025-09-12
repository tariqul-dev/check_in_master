import 'package:check_in_master/src/core/entities/user_entity.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../repositories/home_repository.dart';
import 'do_check_in.dart';

@Injectable()
class DoCheckOut implements BaseUseCase<CheckInOutInput, UserEntity> {
  final HomeRepository repository;

  DoCheckOut({required this.repository});

  @override
  AsyncResult<UserEntity> call(CheckInOutInput input) {
    return repository.doCheckOut(
      user: input.user,
      activeLocation: input.activeLocation,
    );
  }
}
