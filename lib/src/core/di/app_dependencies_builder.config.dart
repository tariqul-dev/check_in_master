// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:check_in_master/src/features/home/data/datasources/local/handle_permission.dart'
    as _i599;
import 'package:check_in_master/src/features/home/data/repositories/home_repository_impl.dart'
    as _i980;
import 'package:check_in_master/src/features/home/domain/repositories/home_repository.dart'
    as _i677;
import 'package:check_in_master/src/features/home/domain/usecases/do_check_in.dart'
    as _i261;
import 'package:check_in_master/src/features/home/domain/usecases/do_check_out.dart'
    as _i939;
import 'package:check_in_master/src/features/home/domain/usecases/get_permission_status.dart'
    as _i468;
import 'package:check_in_master/src/features/home/ui/cubits/home_cubit.dart'
    as _i1062;
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
    gh.factory<_i599.HandlePermission>(
      () => _i599.HandlePermission(location: gh<_i645.Location>()),
    );
    gh.factory<_i677.HomeRepository>(
      () => _i980.HomeRepositoryImpl(
        handlePermission: gh<_i599.HandlePermission>(),
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
