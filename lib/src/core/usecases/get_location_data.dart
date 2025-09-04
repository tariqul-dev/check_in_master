import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../features/store_location/domain/repositories/store_location_repository.dart';

@Injectable()
class GetLocationData implements BaseUseCase<NoParams, LocationDataEntity> {
  final StoreLocationRepository repository;

  GetLocationData({required this.repository});

  @override
  AsyncResult<LocationDataEntity> call(NoParams input) {
    return repository.getLocationData();
  }
}
