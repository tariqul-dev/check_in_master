import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:check_in_master/src/features/location_management/domain/repositories/location_management_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetActiveLocationData
    implements BaseUseCase<NoParams, LocationDataEntity> {
  final LocationManagementRepository repository;

  GetActiveLocationData({required this.repository});

  @override
  AsyncResult<LocationDataEntity> call(NoParams input) {
    return repository.getActiveLocationData();
  }
}
