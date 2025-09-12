import 'package:check_in_master/src/core/cubits/loading_hud/loading_hud_cubit.dart';
import 'package:check_in_master/src/core/di/app_dependencies_builder.dart';
import 'package:check_in_master/src/core/di/user_container.dart';
import 'package:check_in_master/src/core/dialogs/dialog_utils.dart';
import 'package:check_in_master/src/core/entities/user_entity.dart';
import 'package:check_in_master/src/features/auth/ui/pages/auth_page.dart';
import 'package:check_in_master/src/features/location_management/ui/pages/location_management_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/check_in_out/check_in_out_cubit.dart';
import '../cubits/home_cubit.dart';

class HomePage extends StatefulWidget {
  static const path = '/HomePage';

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

  late final UserContainer _userContainer;

  @override
  void initState() {
    super.initState();

    _homeCubit = getIt<HomeCubit>();
    _checkInOutCubit = getIt<CheckInOutCubit>();
    _userContainer = getIt<UserContainer>();
    _loadingCubit = LoadingHudCubit();
  }

  bool isCheckedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Check In Master')),
      drawer: _buildDrawer(context),
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
            const SizedBox(height: 20),
            _buildCheckInButton(),
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
          loading: (_) => const CircularProgressIndicator(),
          failure: (s) => Text('Error: ${s.message}'),
          orElse: () => const Text('Welcome'),
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
            checkedIn: (_) => const Text('Check-Out'),
            checkedOut: (_) => const Text('Check-In'),
            orElse: () => const Text('Tap to check in'),
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
      checkedIn: (_) {
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

  Widget _buildDrawer(BuildContext context) {
    final UserEntity user = _userContainer.currentUser;
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user.name),
              accountEmail: Text(user.email),
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person, size: 40),
              ),
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text("Set Office Location"),
                    onTap: () {
                      Navigator.of(
                        context,
                      ).push(LocationManagementPage.route());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.people),
                    title: const Text("Show Checked-in Users"),
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to checked-in users page
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                // TODO: clear session / Firebase signOut
                Navigator.of(context).pushReplacement(AuthPage.route());
              },
            ),
          ],
        ),
      ),
    );
  }
}
