import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:check_in_master/src/features/home/domain/entities/permission_entity.dart';
import 'package:check_in_master/src/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetPermissionStatus implements BaseUseCase<NoParams, Status> {
  final HomeRepository repository;

  GetPermissionStatus({required this.repository});

  @override
  AsyncResult<Status> call(NoParams input) async {
    return repository.getPermissionStatus();
  }
}
