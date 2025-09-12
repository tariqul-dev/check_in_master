import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final int? checkInDateTime;
  final int? checkOutDateTime;

  const UserEntity({
    required this.name,
    required this.email,
    required this.checkInDateTime,
    required this.checkOutDateTime,
  });

  @override
  List<Object?> get props => [name, email, checkInDateTime, checkOutDateTime];
}
