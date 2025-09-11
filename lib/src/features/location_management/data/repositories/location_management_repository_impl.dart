import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/errors/exceptions/exceptions.dart';
import 'package:check_in_master/src/core/errors/failures/failures.dart';
import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/location_management_repository.dart';
import '../datasources/remote/location_remote_datasource.dart';

@Injectable(as: LocationManagementRepository)
class LocationManagementRepositoryImpl implements LocationManagementRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationManagementRepositoryImpl({required this.remoteDataSource});

  @override
  AsyncResult<LocationDataEntity> getActiveLocationData() async {
    try {
      final LocationDataModel locationDataModel = await remoteDataSource
          .getActiveLocationData();
      return Left(locationDataModel.toEntity());
    } on NoDataFoundException catch (e) {
      return Right(NoDataFoundFailure(e.toString()));
    } catch (e) {
      return Right(UnknownFailure(e.toString()));
    }
  }

  @override
  AsyncResult<LocationDataEntity> saveLocationData(
    LocationDataEntity locationData, {
    String? currentActiveLocationId,
  }) async {
    try {
      final savedData = await remoteDataSource.saveLocationData(
        locationDataModel: LocationDataModel.fromEntity(locationData),
        currentActiveLocationId: currentActiveLocationId,
      );
      return Left(savedData.toEntity());
    } on CreatingLocationException catch (e) {
      return Right(CreatingLocationFailure(e.message));
    } catch (e) {
      return Right(UnknownFailure(e.toString()));
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
      throw UpdateLocationException('Location activation failed');
    } on UpdateLocationException catch (e) {
      return Right(UpdateLocationFailure(e.message));
    } catch (e) {
      return Right(UnknownFailure(e.toString()));
    }
  }

  @override
  AsyncResult<List<LocationDataEntity>> getLocations() async {
    try {
      final models = await remoteDataSource.getLocations();
      final entities = await compute(_mapAndSortLocations, models);
      return Left(entities);
    } on NoDataFoundException catch (e) {
      return Right(NoDataFoundFailure(e.message));
    } catch (e) {
      return Right(UnknownFailure(e.toString()));
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
