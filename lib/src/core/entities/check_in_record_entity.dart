import 'package:equatable/equatable.dart';

class CheckInRecordEntity extends Equatable {
  final String id;
  final String userId;
  final String locationId;
  final int checkInDateTime;
  final int? checkOutDateTime;

  const CheckInRecordEntity({
    required this.id,
    required this.userId,
    required this.locationId,
    required this.checkInDateTime,
    this.checkOutDateTime,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    locationId,
    checkInDateTime,
    checkOutDateTime,
  ];
}
