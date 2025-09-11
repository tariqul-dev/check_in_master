import 'package:check_in_master/src/core/di/app_dependencies_builder.dart';
import 'package:check_in_master/src/features/auth/ui/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependency(Env.prod);

  runApp(const CheckInMasterApp());
}

class CheckInMasterApp extends StatelessWidget {
  const CheckInMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Check In Master",
      home: AuthPage(),
    );
  }
}
