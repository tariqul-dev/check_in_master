import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/entities/user_entity.dart';
import 'package:check_in_master/src/core/errors/exceptions/exceptions.dart';
import 'package:check_in_master/src/core/errors/failures/failures.dart';
import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:check_in_master/src/core/models/user_model.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/features/home/data/datasources/local/eligibility_checker.dart';
import 'package:check_in_master/src/features/home/data/datasources/remote/check_in_out_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final CheckInOutRemoteDataSource checkInOutRemoteDataSource;
  final EligibilityChecker eligibilityChecker;

  HomeRepositoryImpl({
    required this.checkInOutRemoteDataSource,
    required this.eligibilityChecker,
  });

  @override
  AsyncResult<UserEntity> doCheckIn({
    required UserEntity user,
    required LocationDataEntity activeLocation,
  }) async {
    try {
      final checkedInUser = await checkInOutRemoteDataSource.checkIn(
        user: UserModel.fromEntity(user),
        activeLocation: LocationDataModel.fromEntity(activeLocation),
      );
      return Left(checkedInUser.toEntity());
    } on CheckInException catch (e) {
      return Right(CheckInFailure(e.message));
    } catch (e) {
      return Right(UnknownFailure(e.toString()));
    }
  }

  @override
  AsyncResult<UserEntity> doCheckOut({
    required UserEntity user,
    required LocationDataEntity activeLocation,
  }) async {
    try {
      final checkedOutUser = await checkInOutRemoteDataSource.checkOut(
        user: UserModel.fromEntity(user),
        activeLocation: LocationDataModel.fromEntity(activeLocation),
      );
      return Left(checkedOutUser.toEntity());
    } on CheckOutException catch (e) {
      return Right(CheckOutFailure(e.message));
    } catch (e) {
      return Right(UnknownFailure(e.toString()));
    }
  }
}
