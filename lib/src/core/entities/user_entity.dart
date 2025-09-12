import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final bool isCheckedIn;

  final String? locationId;
  final int? checkInDateTime;
  final int? checkOutDateTime;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.isCheckedIn,
    this.locationId,
    this.checkInDateTime,
    this.checkOutDateTime,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    isCheckedIn,
    locationId,
    checkInDateTime,
    checkOutDateTime,
  ];
}
