import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../repositories/location_management_repository.dart';

@injectable
class UpdateLocationActiveStatusById
    implements BaseUseCase<UpdateLocationActivationInput, LocationDataEntity> {
  final LocationManagementRepository repository;

  UpdateLocationActiveStatusById({required this.repository});

  @override
  AsyncResult<LocationDataEntity> call(UpdateLocationActivationInput input) {
    return repository.updateLocationActiveStatusById(
      input.currentActiveLocationId,
      input.updatableLocationEntity,
    );
  }
}

class UpdateLocationActivationInput {
  final String currentActiveLocationId;
  final LocationDataEntity updatableLocationEntity;

  UpdateLocationActivationInput({
    required this.currentActiveLocationId,
    required this.updatableLocationEntity,
  });
}
