import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';

abstract class LocationManagementRepository {
  AsyncResult<bool> saveLocationData(
    LocationDataEntity locationData, {
    String? currentActiveLocationId,
  });

  AsyncResult<LocationDataEntity> getActiveLocationData();

  AsyncResult<List<LocationDataEntity>> getLocations();
}
