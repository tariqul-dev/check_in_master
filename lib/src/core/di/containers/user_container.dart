import 'package:injectable/injectable.dart';

import '../../entities/user_entity.dart';

@lazySingleton
class UserContainer {
  UserEntity? _currentUser;

  UserEntity get currentUser =>
      _currentUser ??
      UserEntity(
        name: '',
        email: '',
        checkInDateTime: null,
        checkOutDateTime: null,
        id: '',
        isCheckedIn: false,
      );

  void setUser(UserEntity user) {
    _currentUser = user;
  }

  void clearUser() {
    _currentUser = null;
  }

  bool get isLoggedIn => _currentUser != null;

  bool get isCheckedIn => _currentUser?.isCheckedIn ?? false;
}
