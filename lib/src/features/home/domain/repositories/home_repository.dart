import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/features/home/domain/entities/check_in_entity.dart';
import 'package:check_in_master/src/features/home/domain/entities/check_out_entity.dart';
import 'package:check_in_master/src/features/home/domain/entities/permission_entity.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRepository {
  AsyncResult<Status> getPermissionStatus();

  AsyncResult<bool> doCheckIn(CheckInEntity checkInEntity);

  AsyncResult<bool> doCheckOut(CheckOutEntity checkOutEntity);
}
