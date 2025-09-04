import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:check_in_master/src/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CheckEligibility implements BaseUseCase<LocationDataEntity, bool> {
  final HomeRepository repository;

  CheckEligibility({required this.repository});

  @override
  AsyncResult<bool> call(LocationDataEntity input) {
    return repository.checkEligibility(input);
  }
}
