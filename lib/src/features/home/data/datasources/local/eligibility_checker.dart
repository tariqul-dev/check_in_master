import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:check_in_master/src/core/utils/calculate_distance.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@Injectable()
class EligibilityChecker {
  final Location location;

  EligibilityChecker({required this.location});

  Future<bool> checkEligibility(LocationDataModel locationDataModel) async {
    final currentLocation = await _getCurrentLocation();
    final distance = calculateDistance(
      locationDataModel.lat,
      locationDataModel.lng,
      currentLocation.latitude ?? 9999999999,
      currentLocation.longitude ?? 9999999999,
    );

    return distance <= 1.0;
  }

  Future<LocationData> _getCurrentLocation() {
    return location.getLocation();
  }
}
