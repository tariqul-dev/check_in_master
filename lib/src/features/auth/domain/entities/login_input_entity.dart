import 'package:equatable/equatable.dart';

class LoginInputEntity extends Equatable {
  final String email;
  final String password;

  const LoginInputEntity({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
