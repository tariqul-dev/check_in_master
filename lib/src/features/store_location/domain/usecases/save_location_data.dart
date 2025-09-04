import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:check_in_master/src/features/store_location/domain/repositories/store_location_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SaveLocationData implements BaseUseCase<LocationDataEntity, bool> {
  final StoreLocationRepository repository;

  SaveLocationData({required this.repository});

  @override
  AsyncResult<bool> call(LocationDataEntity input) {
    return repository.saveLocationData(input);
  }
}
