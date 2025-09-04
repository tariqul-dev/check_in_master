import 'package:check_in_master/src/core/di/app_dependencies_builder.config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

final GetIt getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @lazySingleton
  Location get location => Location();
}

@InjectableInit(initializerName: '\$configureDependency')
void configureDependency(String env) =>
    getIt.$configureDependency(environment: env);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
