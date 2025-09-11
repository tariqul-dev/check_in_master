import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/errors/exceptions/no_data_found_exception.dart';
import 'package:check_in_master/src/core/errors/failures/base_failure.dart';
import 'package:check_in_master/src/core/errors/failures/no_data_found_failure.dart';
import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/location_management_repository.dart';
import '../datasources/remote/remote_datasource.dart';

@Injectable(as: LocationManagementRepository)
class LocationManagementRepositoryImpl implements LocationManagementRepository {
  final RemoteDataSource remoteDataSource;

  LocationManagementRepositoryImpl({required this.remoteDataSource});

  @override
  AsyncResult<LocationDataEntity> getActiveLocationData() async {
    try {
      final LocationDataModel locationDataModel = await remoteDataSource
          .getActiveLocationData();
      return Left(locationDataModel.toEntity());
    } on NoDataFoundException catch (e) {
      return Right(NoDataFoundFailure(e.toString()));
    }
  }

  @override
  AsyncResult<LocationDataEntity> saveLocationData(
    LocationDataEntity locationData, {
    String? currentActiveLocationId,
  }) async {
    try {
      final savedData = await remoteDataSource.saveLocationData(
        LocationDataModel.fromEntity(locationData),
        currentActiveLocationId,
      );
      return Left(savedData.toEntity());
    } catch (e) {
      return Right(BaseFailure(e.toString()));
    }
  }

  @override
  AsyncResult<LocationDataEntity> updateLocationActiveStatusById(
    String currentActiveLocationId,
    LocationDataEntity locationDataEntity,
  ) async {
    try {
      final updatedLocationId = await remoteDataSource.updateActiveLocation(
        currentActiveLocationId: currentActiveLocationId,
        updatableLocationId: locationDataEntity.id,
      );
      if (updatedLocationId == locationDataEntity.id) {
        return Left(locationDataEntity);
      }
      return Right(BaseFailure('Location activation failed'));
    } catch (e) {
      return Right(BaseFailure(e.toString()));
    }
  }

  @override
  AsyncResult<List<LocationDataEntity>> getLocations() async {
    try {
      final models = await remoteDataSource.getLocations();
      final entities = await compute(_mapAndSortLocations, models);
      return Left(entities);
    } catch (e) {
      return Right(BaseFailure(e.toString()));
    }
  }

  List<LocationDataEntity> _mapAndSortLocations(
    List<LocationDataModel> models,
  ) {
    final list = models.map((m) => m.toEntity()).toList();
    list.sort((a, b) {
      if (a.active && !b.active) return -1;
      if (!a.active && b.active) return 1;
      return 0;
    });
    return list;
  }
}
