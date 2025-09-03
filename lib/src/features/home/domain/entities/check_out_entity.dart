import 'package:check_in_master/src/core/entities/location_data.dart';
import 'package:equatable/equatable.dart';

class CheckOutEntity extends Equatable {
  final int inTime;
  final LocationData locationData;

  const CheckOutEntity({required this.inTime, required this.locationData});

  @override
  List<Object?> get props => [inTime, locationData];
}
