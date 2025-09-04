import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/errors/failures/base_failure.dart';
import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/features/store_location/data/datasources/remote/remote_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/store_location_repository.dart';

@Injectable(as: StoreLocationRepository)
class StoreLocationRepositoryImpl implements StoreLocationRepository {
  final RemoteDataSource remoteDataSource;

  StoreLocationRepositoryImpl({required this.remoteDataSource});

  @override
  AsyncResult<LocationDataEntity> getLocationData() async {
    try {
      final LocationDataModel locationDataModel = await remoteDataSource
          .getLocationData();
      return Left(locationDataModel.toEntity());
    } catch (e) {
      return Right(BaseFailure(e.toString()));
    }
  }

  @override
  AsyncResult<bool> saveLocationData(LocationDataEntity locationData) async {
    try {
      final isSavedData = await remoteDataSource.saveLocationData(
        LocationDataModel.fromEntity(locationData),
      );
      return Left(isSavedData);
    } catch (e) {
      return Right(BaseFailure(e.toString()));
    }
  }
}
