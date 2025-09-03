import 'package:equatable/equatable.dart';

class LocationData extends Equatable {
  final double lat;
  final double lng;

  const LocationData({required this.lat, required this.lng});

  @override
  List<Object?> get props => [lat, lng];
}
