import 'package:check_in_master/src/features/home/domain/entities/permission_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@Injectable()
class HandlePermission {
  final Location location;

  HandlePermission({required this.location});

  Future<Status> checkPermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.granted) {
      return getPermissionStatus(permissionStatus);
    } else {
      return await askLocationPermission();
    }
  }

  Future<Status> askLocationPermission() async {
    final PermissionStatus requestPermissionStatus = await location
        .requestPermission();

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
