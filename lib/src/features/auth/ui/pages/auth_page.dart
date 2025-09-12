import 'dart:async';

import 'package:check_in_master/src/core/di/app_dependencies_builder.dart';
import 'package:check_in_master/src/core/di/containers/user_container.dart';
import 'package:check_in_master/src/core/dialogs/dialog_utils.dart';
import 'package:check_in_master/src/features/auth/ui/cubits/auth_cubit.dart';
import 'package:check_in_master/src/features/home/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  static const path = '/AuthPage';

  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (_) => const AuthPage(),
      settings: RouteSettings(name: AuthPage.path),
    );
  }

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _loginFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();

  // Login controllers
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();

  // Register controllers
  final _registerNameController = TextEditingController();
  final _registerEmailController = TextEditingController();
  final _registerPasswordController = TextEditingController();

  late final AuthCubit _authCubit;
  late final StreamSubscription<AuthState> _authStateStreamSubscription;
  late final UserContainer _userContainer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _authCubit = getIt<AuthCubit>();
    _userContainer = getIt<UserContainer>();
    _authStateStreamSubscription = _authCubit.stream.listen(
      _authStateStreamSubscriptionListener,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _registerNameController.dispose();
    _registerEmailController.dispose();
    _registerPasswordController.dispose();
    _authCubit.close();
    _authStateStreamSubscription.cancel();
    super.dispose();
  }

  void _login() {
    if (_loginFormKey.currentState!.validate()) {
      _authCubit.login(
        email: _loginEmailController.text.trim(),
        password: _loginPasswordController.text.trim(),
      );
    }
  }

  void _register() {
    if (_registerFormKey.currentState!.validate()) {
      _authCubit.register(
        name: _registerNameController.text.trim(),
        email: _registerEmailController.text.trim(),
        password: _registerPasswordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authentication"),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Login"),
            Tab(text: "Register"),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [_buildLoginForm(), _buildRegisterForm()],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _loginFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: _loginEmailController,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) => value!.isEmpty ? "Enter your email" : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _loginPasswordController,
              decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (value) =>
                  value!.isEmpty ? "Enter your password" : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text("Login")),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _registerFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: _registerNameController,
              decoration: const InputDecoration(
                labelText: "Name",
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) => value!.isEmpty ? "Enter your name" : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _registerEmailController,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) => value!.isEmpty ? "Enter your email" : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _registerPasswordController,
              decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (value) =>
                  value!.isEmpty ? "Enter your password" : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _register, child: const Text("Register")),
          ],
        ),
      ),
    );
  }

  void _authStateStreamSubscriptionListener(AuthState state) {
    state.maybeWhen(
      inProgress: () {
        DialogUtils.showLoadingDialog(context: context);
      },

      failure: (message) {
        DialogUtils.hideDialog(context);
        DialogUtils.showMessageDialog(
          context: context,
          title: 'Error',
          message: message,
        );
      },
      success: (user) {
        _userContainer.setUser(user);
        DialogUtils.hideDialog(context);
        Navigator.of(
          context,
        ).pushAndRemoveUntil(HomePage.route(), (route) => false);
      },
      orElse: () {},
    );
  }
}
