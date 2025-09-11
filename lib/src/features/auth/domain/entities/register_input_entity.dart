import 'package:equatable/equatable.dart';

class RegisterInputEntity extends Equatable {
  final String name;
  final String email;
  final String password;

  const RegisterInputEntity({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}
