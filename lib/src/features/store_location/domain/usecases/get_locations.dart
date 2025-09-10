import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:check_in_master/src/features/store_location/domain/repositories/store_location_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetLocations implements BaseUseCase<NoParams, List<LocationDataEntity>> {
  final StoreLocationRepository repository;

  GetLocations({required this.repository});

  @override
  AsyncResult<List<LocationDataEntity>> call(NoParams input) {
    return repository.getLocations();
  }
}
