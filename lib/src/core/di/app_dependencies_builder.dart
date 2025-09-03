import 'package:check_in_master/src/core/di/app_dependencies_builder.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: '\$configureDependency')
void configureDependency(String env) => getIt.$configureDependency(environment: env);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
