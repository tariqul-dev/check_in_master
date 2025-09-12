import 'package:check_in_master/src/core/constants.dart';
import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocationContainer {
  LocationDataEntity? _currentActiveLocation;

  LocationDataEntity get currentActiveLocation =>
      _currentActiveLocation ??
      LocationDataEntity(
        id: '',
        lat: defaultLocationData.latitude,
        lng: defaultLocationData.longitude,
        name: '',
        active: false,
        createdAt: 0,
        checkedInUserIds: [],
      );

  void setCurrentActiveLocation(LocationDataEntity location) {
    _currentActiveLocation = location;
  }

  void clearLocation() {
    _currentActiveLocation = null;
  }

  bool get isActiveLocationFound => _currentActiveLocation != null;
}
