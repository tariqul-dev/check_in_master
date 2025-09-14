import 'dart:async';

import 'package:check_in_master/src/core/di/app_dependencies_builder.dart';
import 'package:check_in_master/src/core/di/containers/location_container.dart';
import 'package:check_in_master/src/core/di/containers/user_container.dart';
import 'package:check_in_master/src/core/dialogs/dialog_utils.dart';
import 'package:check_in_master/src/core/entities/user_entity.dart';
import 'package:check_in_master/src/features/auth/ui/cubits/auth_cubit.dart';
import 'package:check_in_master/src/features/auth/ui/pages/auth_page.dart';
import 'package:check_in_master/src/features/location_management/ui/pages/location_management_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late final AuthCubit _authCubit;

  late final UserContainer _userContainer;
  late final LocationContainer _locationContainer;

  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  void initState() {
    super.initState();

    _homeCubit = getIt<HomeCubit>();
    _authCubit = getIt<AuthCubit>();

    _userContainer = getIt<UserContainer>();
    _locationContainer = getIt<LocationContainer>();

    _homeCubit.getCheckInStatus(user: _userContainer.currentUser);

    _authStateSubscription = _authCubit.stream.listen(
      _authStateSubscriptionListener,
    );
  }

  @override
  void dispose() {
    _authCubit.close();
    _homeCubit.close();

    _authStateSubscription.cancel();
    super.dispose();
  }

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocConsumer<HomeCubit, HomeState>(
            bloc: _homeCubit,
            listener: _homeStateListener,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCenter(state),
                  const SizedBox(height: 20),
                  _buildCheckInButton(state),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCenter(HomeState state) {
    return state.maybeWhen(
      inProgress: () => const CircularProgressIndicator(),
      failure: (s) => Text(s),
      checkedIn: (user) {
        return Text('Checked In');
      },
      checkedOut: (user) {
        return Text('Checked Out');
      },
      orElse: () => Text('Tap to check in'),
    );
  }

  Widget _buildCheckInButton(HomeState state) {
    return OutlinedButton(
      onPressed: () {
        if (_userContainer.isCheckedIn) {
          _homeCubit.performCheckOut(
            user: _userContainer.currentUser,
            activeLocation: _locationContainer.currentActiveLocation,
          );
          return;
        }
        _homeCubit.performCheckIn(
          user: _userContainer.currentUser,
          activeLocation: _locationContainer.currentActiveLocation,
        );
      },
      child: Text(
        state.maybeMap(
          checkedIn: (_) => 'Check-Out',
          checkedOut: (_) => 'Check-In',
          orElse: () => _userContainer.isCheckedIn ? 'Check-Out' : 'Check-In',
        ),
      ),
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
                      Navigator.of(context).pop();
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
                _authCubit.logout();
                Navigator.of(context).pushReplacement(AuthPage.route());
              },
            ),
          ],
        ),
      ),
    );
  }

  void _homeStateListener(BuildContext context, HomeState state) {
    state.maybeWhen(
      inProgress: () {
        DialogUtils.showLoadingDialog(context: context);
      },
      failure: (s) {
        DialogUtils.hideDialog(context);
        DialogUtils.showMessageDialog(
          context: context,
          title: "Error",
          message: s,
        );
      },
      checkedIn: (user) {
        _userContainer.setUser(user);
        DialogUtils.hideDialog(context);
      },
      checkedOut: (user) {
        _userContainer.setUser(user);
        DialogUtils.hideDialog(context);
      },
      orElse: () {},
    );
  }

  void _authStateSubscriptionListener(AuthState state) {
    state.maybeMap(
      inProgress: (_) {
        DialogUtils.showLoadingDialog(context: context);
      },
      loggedOut: (_) {
        DialogUtils.hideDialog(context);
        Navigator.pushAndRemoveUntil(
          context,
          AuthPage.route(),
          (route) => false,
        );
      },

      orElse: () {
        DialogUtils.hideDialog(context);
      },
    );
  }
}
