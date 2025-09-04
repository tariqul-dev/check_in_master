import 'package:equatable/equatable.dart';

class LocationDataEntity extends Equatable {
  final double lat;
  final double lng;

  const LocationDataEntity({required this.lat, required this.lng});

  @override
  List<Object?> get props => [lat, lng];
}
