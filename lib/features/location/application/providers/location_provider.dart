import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/features/location/application/notifiers/location_permission_notifier.dart';
import 'package:wb_sweet_sweat/features/location/infrastructure/services/location_service.dart';

part 'location_provider.g.dart';

@riverpod
LocationService locationService(LocationServiceRef ref) {
  return LocationService();
}

@riverpod
Stream<Position> locationStream(
  LocationStreamRef ref,
) async* {
  final locationService = ref.watch(locationServiceProvider);

  // final StreamController<Position> streamController =
  //     StreamController<Position>.broadcast();

  // final subscribe = platform
  //     .getPositionStream(locationSettings: service.getLocationSettings())
  //     .listen((Position position) {
  //   streamController.add(position);

  //   logger.d('LocationStreamService::::::: ${position.speed}');
  //   // logger.d('LocationStreamService::::::: _streamSubscription :: $position');
  // });

  // void dispose() {
  //   streamController?.close();
  //   subscribe?.cancel();
  //   logger.d('LocationStreamService::::::: dispose');
  // }

  // ref.onDispose(dispose);

  // yield* streamController.stream;
  yield* locationService.getPositionStream();
}

// @riverpod
// Future<void> locationPermissionStatusChange(
//   LocationPermissionStatusChangeRef ref,
// ) async {
//   final locationService = ref.watch(locationServiceProvider);
//   await locationService.enableLocationService();

//   final permissionNotifier =
//       ref.watch(locationPermissionNotifierProvider.notifier);
//   StreamSubscription<PermissionStatus> permissionSubscription = locationService
//       .permissionStatusChange
//       .listen(permissionNotifier.updateByPermissionStatus);

//   // ref.onDispose(permissionSubscription.cancel);
// }

@riverpod
Future<void> locationRequestPermission(LocationRequestPermissionRef ref) async {
  final checkedPermission = await Geolocator.checkPermission();
  ref.watch(locationPermissionStateProvider.notifier).update(checkedPermission);

  if (checkedPermission == LocationPermission.denied ||
      checkedPermission == LocationPermission.unableToDetermine) {
    ref
        .watch(locationPermissionStateProvider.notifier)
        .update(await GeolocatorPlatform.instance.requestPermission());
  }
}

@Riverpod(keepAlive: true)
class LocationPermissionState extends _$LocationPermissionState {
  @override
  LocationPermission build() => LocationPermission.denied;

  update(LocationPermission permission) {
    state = permission;
  }
}
