// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:wb_sweet_sweat/features/location/application/providers/location_provider.dart';
// import 'package:wb_sweet_sweat/features/map/application/notifiers/map_camera_notifier.dart';

// part 'map_controller_provider.g.dart';

// @riverpod
// void mapController(MapControllerRef ref) async {
//   // MyLocationCameraPositionNotifier 값 초기화
//   final myLocationCameraPositionNotifier =
//       ref.read(myLocationCameraPositionNotifierProvider.notifier);
//   await myLocationCameraPositionNotifier.initialize();

//   ref.listen(
//     locationStreamProvider,
//     (previous, next) {
//       state?.animateCamera(
//         CameraUpdate.newCameraPosition(next),
//       );
//     },
//   );
// }
