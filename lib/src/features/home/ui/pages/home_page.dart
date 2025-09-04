import 'package:check_in_master/src/core/di/app_dependencies_builder.dart';
import 'package:check_in_master/src/features/home/domain/entities/permission_entity.dart';
import 'package:check_in_master/src/features/home/ui/cubits/home_cubit.dart';
import 'package:check_in_master/src/features/store_location/ui/pages/set_location_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const path = '/home';

  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (_) => HomePage(),
      settings: RouteSettings(name: HomePage.path),
    );
  }

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();

    _homeCubit = getIt<HomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check In Master')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCenter(),
            SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                _homeCubit.checkPermission();
              },
              child: Text('Check Permission'),
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(SetLocationPage.route());
              },
              child: Text('Set office location'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenter() {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _homeCubit,
      builder: (context, state) {
        return state.maybeMap(
          loading: (loadingState) => CircularProgressIndicator(),
          failure: (failureState) => Text('Error: ${failureState.message}'),
          hasLocationPermission: (hasLocationPermissionState) {
            final Status permissionStatus =
                hasLocationPermissionState.permissionStatus;
            if (permissionStatus == Status.granted) {
              return _buildCheckInButton();
            }
            return Text('Location permission is missing');
          },
          orElse: () => Text('Welcome'),
        );
      },
    );
  }

  Widget _buildCheckInButton() {
    return OutlinedButton(onPressed: () {}, child: Text('Check-In'));
  }
}
