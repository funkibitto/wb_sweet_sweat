import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/core/utils/logger.dart';
import 'package:wb_sweet_sweat/features/location/application/providers/location_provider.dart';
import 'package:wb_sweet_sweat/features/map/application/constants/map_settings.dart';

part 'map_camera_notifier.g.dart';

@riverpod
class MapCameraNotifier extends _$MapCameraNotifier {
  @override
  CameraPosition? build() {
    return null;
  }

  CameraPosition? get cameraPosition => state;

  void initialize() {
    // locationStreamProvider 값이 변경되면, CameraPosition 을 변경한다.
    ref.listen(
      locationStreamProvider,
      (previous, next) {
        next.whenData((position) {
          updateByPosition(position);
        });
      },
    );
  }

  CameraPosition convertCameraPosition(Position position) {
    LatLng latLng = LatLng(
      position.latitude,
      position.longitude,
    );
    double bearing = position.heading;

    return CameraPosition(
      target: latLng,
      bearing: bearing,
      tilt: 0.0,
      zoom: defaultMapZoom,
    );
  }

  void update(CameraPosition cameraPosition) {
    state = cameraPosition;
  }

  void updateByPosition(Position position) {
    state = convertCameraPosition(position);
    logger.d('updateByPosition::::::::::::: $state');
  }
}



// @riverpod
// CameraPosition myLocationCameraPosition(MyLocationCameraPositionRef ref) {
//   final myLocation =
//       ref.watch(locationStreamProvider.select((value) => value.valueOrNull));

//   return CameraPosition(
//     target: LatLng(
//       myLocation?.latitude ?? defaultLatLng.latitude,
//       myLocation?.longitude ?? defaultLatLng.longitude,
//     ),
//     tilt: 0.0,
//     bearing: myLocation?.heading ?? 0.0,
//     zoom: defaultMapZoom,
//   );
// }
