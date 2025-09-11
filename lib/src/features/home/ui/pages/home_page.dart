import 'package:check_in_master/src/core/cubits/loading_hud/loading_hud_cubit.dart';
import 'package:check_in_master/src/core/di/app_dependencies_builder.dart';
import 'package:check_in_master/src/core/dialogs/dialog_utils.dart';
import 'package:check_in_master/src/features/home/domain/entities/permission_entity.dart';
import 'package:check_in_master/src/features/home/ui/cubits/check_in_out/check_in_out_cubit.dart';
import 'package:check_in_master/src/features/home/ui/cubits/home_cubit.dart';
import 'package:check_in_master/src/features/location_management/ui/pages/location_management_page.dart';
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
  late final CheckInOutCubit _checkInOutCubit;
  late final LoadingHudCubit _loadingCubit;

  @override
  void initState() {
    super.initState();

    _homeCubit = getIt<HomeCubit>();
    _checkInOutCubit = getIt<CheckInOutCubit>();
    _loadingCubit = LoadingHudCubit();
  }

  bool isCheckedIn = false;

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
                Navigator.of(context).push(LocationManagementPage.route());
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
    return BlocConsumer<CheckInOutCubit, CheckInOutState>(
      bloc: _checkInOutCubit,
      listener: _checkInOutStateListener,
      builder: (context, state) {
        return OutlinedButton(
          onPressed: () {
            if (isCheckedIn) {
              _checkInOutCubit.checkOut();
              return;
            }
            _checkInOutCubit.checkIn();
          },
          child: state.maybeMap(
            checkedIn: (s) => Text('Check-Out'),
            checkedOut: (s) => Text('Check-In'),
            orElse: () => Text('Tap to check in'),
          ),
        );
      },
    );
  }

  void _checkInOutStateListener(BuildContext context, CheckInOutState state) {
    state.map(
      initial: (_) {},
      loading: (_) {
        _loadingCubit.startLoading();
        DialogUtils.showLoadingDialog(context: context);
      },
      failure: (s) {
        _loadingCubit.completeLoading();
        DialogUtils.hideDialog(context);
        DialogUtils.showMessageDialog(
          context: context,
          title: "Error",
          message: s.message,
        );
      },
      checkedIn: (s) {
        _loadingCubit.completeLoading();
        DialogUtils.hideDialog(context);
        isCheckedIn = true;
      },
      checkedOut: (_) {
        _loadingCubit.completeLoading();
        DialogUtils.hideDialog(context);
        isCheckedIn = false;
      },
    );
  }
}
