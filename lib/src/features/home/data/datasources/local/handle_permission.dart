import 'package:check_in_master/src/core/errors/exceptions/location_exception.dart';
import 'package:check_in_master/src/features/home/domain/entities/permission_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@Injectable()
class HandlePermission {
  final Location location;

  HandlePermission({required this.location});

  Future<Status> checkPermission() async {
    final bool isLocationServiceEnabled = await location.serviceEnabled();

    if (!isLocationServiceEnabled) {
      final bool isServiceStillDisabled = await location.requestService();
      if (isServiceStillDisabled) {
        throw LocationException(
          message:
              'Service is disabled. Please enable location service from your settings',
        );
      }
    }

    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.granted) {
      return getPermissionStatus(permissionStatus);
    } else {
      return await askLocationPermission();
    }
  }

  Future<Status> askLocationPermission() async {
    final requestPermissionStatus = await location.requestPermission();

    return getPermissionStatus(requestPermissionStatus);
  }

  Status getPermissionStatus(PermissionStatus permissionStatus) {
    return switch (permissionStatus) {
      PermissionStatus.granted => Status.granted,
      PermissionStatus.denied => Status.denied,
      PermissionStatus.deniedForever => Status.permanentlyDenied,
      _ => Status.permanentlyDenied,
    };
  }
}
