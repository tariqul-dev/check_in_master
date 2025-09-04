import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:equatable/equatable.dart';

class StoreLocationData extends Equatable {
  final LocationDataEntity locationData;

  const StoreLocationData({required this.locationData});

  @override
  List<Object?> get props => [locationData];
}
