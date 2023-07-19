import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wb_sweet_sweat/core/utils/logger.dart';
import 'package:wb_sweet_sweat/features/location/domain/services/i_location_service.dart';

class LocationService implements ILocationService {
  final int getLocationTimeLimit = 10; //in seconds
  final int locationChangeInterval = 1; //in seconds
  final int locationChangeDistance = 5; //in meter

  static final LocationService _instance = LocationService._internal();
  static late GeolocatorPlatform geolocatorPlatform;

  factory LocationService() {
    return _instance;
  }

  LocationService._internal() {
    geolocatorPlatform = GeolocatorPlatform.instance;
  }

  @override
  Future<PermissionStatus> requestPermission() async {
    const location = Permission.location;
    final permissionStatus = await location.request();
    return permissionStatus;
  }

  @override
  Stream<PermissionStatus> get permissionStatusChange {
    const permission = Permission.location;

    return permission.status.asStream().map(
      (permissionStatus) {
        if (permissionStatus.isGranted) {
          return PermissionStatus.granted;
        } else if (permissionStatus.isLimited) {
          return PermissionStatus.limited;
        } else if (permissionStatus.isDenied) {
          return PermissionStatus.denied;
        } else if (permissionStatus.isRestricted) {
          return PermissionStatus.restricted;
        } else {
          return PermissionStatus.permanentlyDenied;
        }
      },
    );
  }

  @override
  Future<PermissionStatus> enableLocationService() async {
    var requestStatus = await Permission.location.request();
    var status = await Permission.location.status;
    if (requestStatus.isGranted && status.isLimited) {
      // isLimited - 제한적 동의 (ios 14 < )
      // 요청 동의됨
      logger.d("isGranted");
      if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
        // 요청 동의 + gps 켜짐
        var position = await Geolocator.getCurrentPosition();
        logger.d("serviceStatusIsEnabled position = ${position.toString()}");
      } else {
        // 요청 동의 + gps 꺼짐
        logger.d("serviceStatusIsDisabled");
      }
    } else if (requestStatus.isPermanentlyDenied ||
        status.isPermanentlyDenied) {
      // 권한 요청 거부, 해당 권한에 대한 요청에 대해 다시 묻지 않음 선택하여 설정화면에서 변경해야함. android
      logger.d("isPermanentlyDenied");
      openAppSettings();
    } else if (status.isRestricted) {
      // 권한 요청 거부, 해당 권한에 대한 요청을 표시하지 않도록 선택하여 설정화면에서 변경해야함. ios
      logger.d("isRestricted");
      openAppSettings();
    } else if (status.isDenied) {
      // 권한 요청 거절
      logger.d("isDenied");
    }
    logger.d("requestStatus ${requestStatus.name}");
    logger.d("status ${status.name}");
    return status;
  }

  @override
  LocationSettings getLocationSettings({
    LocationAccuracy? accuracy,
    int? interval,
    int? distanceFilter,
  }) {
    if (Platform.isAndroid) {
      return AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: distanceFilter ?? locationChangeDistance,
        intervalDuration: Duration(seconds: interval ?? locationChangeInterval),
        //Set foreground notification config to keep app alive in background
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationTitle: 'Sweat Sweet',
          notificationText:
              'Sweat Sweet will receive your location in background.',
          notificationIcon:
              AndroidResource(name: 'notification_icon', defType: 'drawable'),
          enableWakeLock: true,
        ),
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      return AppleSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: distanceFilter ?? locationChangeDistance,
        activityType: ActivityType.automotiveNavigation,
        pauseLocationUpdatesAutomatically: true,
        //Set to true to keep app alive in background
        showBackgroundLocationIndicator: true,
      );
    } else {
      return LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: distanceFilter ?? locationChangeDistance,
      );
    }
  }

  @override
  Future<Position> getCurrentPosition() {
    return geolocatorPlatform.getCurrentPosition(
        locationSettings: getLocationSettings());
  }

  @override
  Stream<Position> getPositionStream() {
    return geolocatorPlatform.getPositionStream(
      locationSettings: getLocationSettings(),
    );
    // .throttleTime(Duration(seconds: locationChangeInterval));
  }
}
