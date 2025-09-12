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
import 'package:check_in_master/src/core/di/user_container.dart' as _i625;
import 'package:check_in_master/src/core/usecases/get_active_location_data.dart'
    as _i451;
import 'package:check_in_master/src/core/usecases/get_current_user.dart'
    as _i838;
import 'package:check_in_master/src/core/usecases/logout.dart' as _i644;
import 'package:check_in_master/src/features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i181;
import 'package:check_in_master/src/features/auth/data/repositories/auth_repository_impl.dart'
    as _i313;
import 'package:check_in_master/src/features/auth/domain/repositories/auth_repository.dart'
    as _i409;
import 'package:check_in_master/src/features/auth/domain/usecases/login_with_email_password.dart'
    as _i133;
import 'package:check_in_master/src/features/auth/domain/usecases/register_with_email_password.dart'
    as _i464;
import 'package:check_in_master/src/features/auth/ui/cubits/auth_cubit.dart'
    as _i526;
import 'package:check_in_master/src/features/home/data/datasources/local/eligibility_checker.dart'
    as _i483;
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
import 'package:check_in_master/src/features/home/ui/cubits/check_in_out/check_in_out_cubit.dart'
    as _i1016;
import 'package:check_in_master/src/features/home/ui/cubits/home_cubit.dart'
    as _i1062;
import 'package:check_in_master/src/features/location_management/data/datasources/remote/location_remote_datasource.dart'
    as _i236;
import 'package:check_in_master/src/features/location_management/data/repositories/location_management_repository_impl.dart'
    as _i1036;
import 'package:check_in_master/src/features/location_management/domain/repositories/location_management_repository.dart'
    as _i732;
import 'package:check_in_master/src/features/location_management/domain/usecases/get_locations.dart'
    as _i820;
import 'package:check_in_master/src/features/location_management/domain/usecases/save_location_data.dart'
    as _i1042;
import 'package:check_in_master/src/features/location_management/domain/usecases/update_location_active_status_by_id.dart'
    as _i260;
import 'package:check_in_master/src/features/location_management/ui/cubits/location_fetching/location_fetching_cubit.dart'
    as _i175;
import 'package:check_in_master/src/features/location_management/ui/cubits/location_operation/location_operation_cubit.dart'
    as _i707;
import 'package:check_in_master/src/features/splash_screen/ui/cubits/splash_cubit.dart'
    as _i341;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
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
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i645.Location>(() => registerModule.location);
    gh.lazySingleton<_i625.UserContainer>(() => _i625.UserContainer());
    gh.factory<_i483.EligibilityChecker>(
      () => _i483.EligibilityChecker(location: gh<_i645.Location>()),
    );
    gh.factory<_i236.LocationRemoteDataSource>(
      () => _i236.LocationRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i181.AuthRemoteDataSource>(
      () => _i181.AuthRemoteDataSourceImpl(
        auth: gh<_i59.FirebaseAuth>(),
        firestore: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.factory<_i409.AuthRepository>(
      () => _i313.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i181.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i464.RegisterWithEmailPassword>(
      () => _i464.RegisterWithEmailPassword(
        repository: gh<_i409.AuthRepository>(),
      ),
    );
    gh.factory<_i133.LoginWithEmailPassword>(
      () =>
          _i133.LoginWithEmailPassword(repository: gh<_i409.AuthRepository>()),
    );
    gh.factory<_i838.GetCurrentUser>(
      () => _i838.GetCurrentUser(repository: gh<_i409.AuthRepository>()),
    );
    gh.factory<_i644.Logout>(
      () => _i644.Logout(repository: gh<_i409.AuthRepository>()),
    );
    gh.factory<_i526.AuthCubit>(
      () => _i526.AuthCubit(
        gh<_i838.GetCurrentUser>(),
        gh<_i133.LoginWithEmailPassword>(),
        gh<_i464.RegisterWithEmailPassword>(),
        gh<_i644.Logout>(),
      ),
    );
    gh.factory<_i732.LocationManagementRepository>(
      () => _i1036.LocationManagementRepositoryImpl(
        remoteDataSource: gh<_i236.LocationRemoteDataSource>(),
      ),
    );
    gh.factory<_i260.UpdateLocationActiveStatusById>(
      () => _i260.UpdateLocationActiveStatusById(
        repository: gh<_i732.LocationManagementRepository>(),
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
    gh.factory<_i677.HomeRepository>(
      () => _i980.HomeRepositoryImpl(
        eligibilityChecker: gh<_i483.EligibilityChecker>(),
      ),
    );
    gh.factory<_i341.SplashCubit>(
      () => _i341.SplashCubit(gh<_i838.GetCurrentUser>()),
    );
    gh.factory<_i261.DoCheckIn>(
      () => _i261.DoCheckIn(repository: gh<_i677.HomeRepository>()),
    );
    gh.factory<_i939.DoCheckOut>(
      () => _i939.DoCheckOut(repository: gh<_i677.HomeRepository>()),
    );
    gh.factory<_i284.CheckEligibility>(
      () => _i284.CheckEligibility(repository: gh<_i677.HomeRepository>()),
    );
    gh.factory<_i707.LocationOperationCubit>(
      () => _i707.LocationOperationCubit(
        gh<_i1042.SaveLocationData>(),
        gh<_i451.GetActiveLocationData>(),
        gh<_i260.UpdateLocationActiveStatusById>(),
      ),
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
      () => _i1062.HomeCubit(gh<_i261.DoCheckIn>(), gh<_i939.DoCheckOut>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i205.RegisterModule {}
