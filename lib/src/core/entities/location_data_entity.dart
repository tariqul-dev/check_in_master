import 'package:equatable/equatable.dart';

class LocationDataEntity extends Equatable {
  final String id;
  final double lat;
  final double lng;
  final String name;
  final bool active;
  final int createdAt;

  const LocationDataEntity({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.active,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, lat, lng, name, active, createdAt];
}
