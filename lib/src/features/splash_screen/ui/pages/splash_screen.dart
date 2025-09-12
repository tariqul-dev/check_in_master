import 'package:check_in_master/src/core/di/app_dependencies_builder.dart';
import 'package:check_in_master/src/core/di/user_container.dart';
import 'package:check_in_master/src/core/dialogs/dialog_utils.dart';
import 'package:check_in_master/src/features/auth/ui/pages/auth_page.dart';
import 'package:check_in_master/src/features/home/ui/pages/home_page.dart';
import 'package:check_in_master/src/features/splash_screen/ui/cubits/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const String path = '/SplashScreen';

  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: SplashScreen.path),
      builder: (context) => SplashScreen(),
    );
  }

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashCubit _splashCubit;
  late final UserContainer _userContainer;

  @override
  void initState() {
    super.initState();
    _splashCubit = getIt<SplashCubit>();
    _userContainer = getIt<UserContainer>();
    _splashCubit.checkLoginStatus();
  }

  @override
  void dispose() {
    _splashCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue, body: _buildBody());
  }

  Widget _buildBody() {
    return BlocConsumer<SplashCubit, SplashState>(
      bloc: _splashCubit,
      listener: _splashStateListener,
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 20),
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        );
      },
    );
  }

  void _splashStateListener(BuildContext context, SplashState state) {
    state.maybeWhen(
      loggedIn: (user) {
        _userContainer.setUser(user);
        Navigator.of(context).pushReplacement(HomePage.route());
      },
      loggedOut: () {
        Navigator.of(context).pushReplacement(AuthPage.route());
      },
      failure: (message) {
        Navigator.of(context).pushReplacement(AuthPage.route());
      },
      locationDenied: () {
        DialogUtils.showMessageDialog(
          context: context,
          title: 'Warning',
          message: 'Location permission is required.',
        );
      },
      locationServiceDisabled: () {
        DialogUtils.showMessageDialog(
          context: context,
          title: 'Warning',
          message: 'Please enable location service.',
        );
      },
      orElse: () {},
    );
  }
}
