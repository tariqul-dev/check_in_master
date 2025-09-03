import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:check_in_master/src/features/home/domain/entities/check_in_entity.dart';
import 'package:check_in_master/src/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DoCheckIn implements BaseUseCase<CheckInEntity, bool> {
  final HomeRepository repository;

  DoCheckIn({required this.repository});

  @override
  AsyncResult<bool> call(CheckInEntity input) {
    return repository.doCheckIn(input);
  }
}
