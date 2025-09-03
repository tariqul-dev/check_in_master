import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:check_in_master/src/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/check_out_entity.dart';

@Injectable()
class DoCheckOut implements BaseUseCase<CheckOutEntity, bool> {
  final HomeRepository repository;

  DoCheckOut({required this.repository});

  @override
  AsyncResult<bool> call(CheckOutEntity input) {
    return repository.doCheckOut(input);
  }
}
