import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../repositories/location_management_repository.dart';

@Injectable()
class GetLocations implements BaseUseCase<NoParams, List<LocationDataEntity>> {
  final LocationManagementRepository repository;

  GetLocations({required this.repository});

  @override
  AsyncResult<List<LocationDataEntity>> call(NoParams input) {
    return repository.getLocations();
  }
}
