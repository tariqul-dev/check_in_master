import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:equatable/equatable.dart';

class CheckInEntity extends Equatable {
  final int inTime;
  final String? name;
  final String? email;
  final LocationDataEntity locationData;

  const CheckInEntity({
    required this.inTime,
    required this.locationData,
    this.name,
    this.email,
  });

  @override
  List<Object?> get props => [inTime, locationData, email, name];
}
