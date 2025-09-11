// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:check_in_master/src/core/cubits/loading_hud/loading_hud_cubit.dart'
    as _i100;
import 'package:check_in_master/src/core/di/app_dependencies_builder.dart'
    as _i205;
import 'package:check_in_master/src/core/usecases/get_active_location_data.dart'
    as _i451;
import 'package:check_in_master/src/features/home/data/datasources/local/eligibility_checker.dart'
    as _i483;
import 'package:check_in_master/src/features/home/data/datasources/local/handle_permission.dart'
    as _i599;
import 'package:check_in_master/src/features/home/data/repositories/home_repository_impl.dart'
    as _i980;
import 'package:check_in_master/src/features/home/domain/repositories/home_repository.dart'
    as _i677;
import 'package:check_in_master/src/features/home/domain/usecases/check_eligibility.dart'
    as _i284;
import 'package:check_in_master/src/features/home/domain/usecases/do_check_in.dart'
    as _i261;
import 'package:check_in_master/src/features/home/domain/usecases/do_check_out.dart'
    as _i939;
import 'package:check_in_master/src/features/home/domain/usecases/get_permission_status.dart'
    as _i468;
import 'package:check_in_master/src/features/home/ui/cubits/check_in_out/check_in_out_cubit.dart'
    as _i1016;
import 'package:check_in_master/src/features/home/ui/cubits/home_cubit.dart'
    as _i1062;
import 'package:check_in_master/src/features/location_management/data/datasources/remote/remote_datasource.dart'
    as _i842;
import 'package:check_in_master/src/features/location_management/data/repositories/store_location_repository_impl.dart'
    as _i589;
import 'package:check_in_master/src/features/location_management/domain/repositories/location_management_repository.dart'
    as _i732;
import 'package:check_in_master/src/features/location_management/domain/usecases/get_locations.dart'
    as _i820;
import 'package:check_in_master/src/features/location_management/domain/usecases/save_location_data.dart'
    as _i1042;
import 'package:check_in_master/src/features/location_management/ui/cubits/location_fetching/location_fetching_cubit.dart'
    as _i175;
import 'package:check_in_master/src/features/location_management/ui/cubits/location_operation/location_operation_cubit.dart'
    as _i707;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:location/location.dart' as _i645;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt $configureDependency({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i100.LoadingHudCubit>(() => _i100.LoadingHudCubit());
    gh.lazySingleton<_i974.FirebaseFirestore>(() => registerModule.firestore);
    gh.lazySingleton<_i645.Location>(() => registerModule.location);
    gh.lazySingleton<_i842.RemoteDataSource>(
      () => _i842.RemoteDataSource(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i483.EligibilityChecker>(
      () => _i483.EligibilityChecker(location: gh<_i645.Location>()),
    );
    gh.factory<_i599.HandlePermission>(
      () => _i599.HandlePermission(location: gh<_i645.Location>()),
    );
    gh.factory<_i732.LocationManagementRepository>(
      () => _i589.LocationManagementRepositoryImpl(
        remoteDataSource: gh<_i842.RemoteDataSource>(),
      ),
    );
    gh.factory<_i820.GetLocations>(
      () => _i820.GetLocations(
        repository: gh<_i732.LocationManagementRepository>(),
      ),
    );
    gh.factory<_i1042.SaveLocationData>(
      () => _i1042.SaveLocationData(
        repository: gh<_i732.LocationManagementRepository>(),
      ),
    );
    gh.factory<_i451.GetActiveLocationData>(
      () => _i451.GetActiveLocationData(
        repository: gh<_i732.LocationManagementRepository>(),
      ),
    );
    gh.factory<_i707.LocationOperationCubit>(
      () => _i707.LocationOperationCubit(
        gh<_i1042.SaveLocationData>(),
        gh<_i451.GetActiveLocationData>(),
      ),
    );
    gh.factory<_i677.HomeRepository>(
      () => _i980.HomeRepositoryImpl(
        handlePermission: gh<_i599.HandlePermission>(),
        eligibilityChecker: gh<_i483.EligibilityChecker>(),
      ),
    );
    gh.factory<_i261.DoCheckIn>(
      () => _i261.DoCheckIn(repository: gh<_i677.HomeRepository>()),
    );
    gh.factory<_i468.GetPermissionStatus>(
      () => _i468.GetPermissionStatus(repository: gh<_i677.HomeRepository>()),
    );
    gh.factory<_i939.DoCheckOut>(
      () => _i939.DoCheckOut(repository: gh<_i677.HomeRepository>()),
    );
    gh.factory<_i284.CheckEligibility>(
      () => _i284.CheckEligibility(repository: gh<_i677.HomeRepository>()),
    );
    gh.factory<_i1016.CheckInOutCubit>(
      () => _i1016.CheckInOutCubit(
        gh<_i451.GetActiveLocationData>(),
        gh<_i284.CheckEligibility>(),
      ),
    );
    gh.factory<_i175.LocationFetchingCubit>(
      () => _i175.LocationFetchingCubit(gh<_i820.GetLocations>()),
    );
    gh.factory<_i1062.HomeCubit>(
      () => _i1062.HomeCubit(
        gh<_i261.DoCheckIn>(),
        gh<_i939.DoCheckOut>(),
        gh<_i468.GetPermissionStatus>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i205.RegisterModule {}
