import 'package:check_in_master/src/core/errors/failures/base_failure.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/features/home/data/datasources/local/handle_permission.dart';

import 'package:check_in_master/src/features/home/domain/entities/check_in_entity.dart';

import 'package:check_in_master/src/features/home/domain/entities/check_out_entity.dart';

import 'package:check_in_master/src/features/home/domain/entities/permission_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HandlePermission handlePermission;

  HomeRepositoryImpl({required this.handlePermission});

  @override
  AsyncResult<bool> doCheckIn(CheckInEntity checkInEntity) {
    // TODO: implement doCheckIn
    throw UnimplementedError();
  }

  @override
  AsyncResult<bool> doCheckOut(CheckOutEntity checkOutEntity) {
    // TODO: implement doCheckOut
    throw UnimplementedError();
  }

  @override
  AsyncResult<Status> getPermissionStatus() async {
    try {
      final Status permissionStatus = await handlePermission.checkPermission();
      return Left(permissionStatus);
    } catch (e) {
      return Right(BaseFailure(e.toString()));
    }
  }
}
