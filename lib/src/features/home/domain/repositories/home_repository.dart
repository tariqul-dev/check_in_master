import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/entities/user_entity.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';

abstract class HomeRepository {
  AsyncResult<UserEntity> doCheckIn({
    required UserEntity user,
    required LocationDataEntity activeLocation,
  });

  AsyncResult<UserEntity> doCheckOut({
    required UserEntity user,
    required LocationDataEntity activeLocation,
  });
}
