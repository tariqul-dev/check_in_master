import 'package:equatable/equatable.dart';

class LocationDataEntity extends Equatable {
  final String id;

  final double lat;
  final double lng;
  final String name;
  final bool active;
  final int createdAt;
  final List<String>? checkedInUserIds;

  const LocationDataEntity({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.active,
    required this.createdAt,
    required this.checkedInUserIds,
  });

  @override
  List<Object?> get props => [
    id,
    lat,
    lng,
    name,
    active,
    createdAt,
    checkedInUserIds,
  ];
}
