import 'package:equatable/equatable.dart';

class LocationDataEntity extends Equatable {
  final double lat;
  final double lng;
  final bool active;
  final int createdAt;

  const LocationDataEntity({
    required this.lat,
    required this.lng,
    required this.active,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [lat, lng, active];
}
