import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/errors/failures/failures.dart';
import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/features/home/data/datasources/local/eligibility_checker.dart';
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
  final EligibilityChecker eligibilityChecker;

  HomeRepositoryImpl({
    required this.handlePermission,
    required this.eligibilityChecker,
  });

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
      return Right(UnknownFailure(e.toString()));
    }
  }

  @override
  AsyncResult<bool> checkEligibility(
    LocationDataEntity locationDataEntity,
  ) async {
    try {
      final bool isEligible = await eligibilityChecker.checkEligibility(
        LocationDataModel.fromEntity(locationDataEntity),
      );
      if (!isEligible) {
        throw Exception(
          'Check-in failed: You must be within 1 km of the designated location.',
        );
      }
      return Left(isEligible);
    } catch (e) {
      return Right(UnknownFailure(e.toString()));
    }
  }
}
