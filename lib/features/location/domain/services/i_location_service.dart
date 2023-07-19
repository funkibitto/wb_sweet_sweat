import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class ILocationService {
  Future<Position> getCurrentPosition();

  LocationSettings getLocationSettings({
    LocationAccuracy? accuracy,
    int? interval,
    int? distanceFilter,
  });

  Future<PermissionStatus> requestPermission();

  Stream<Position> getPositionStream();

  Stream<PermissionStatus> get permissionStatusChange;

  Future<PermissionStatus> enableLocationService();
}
