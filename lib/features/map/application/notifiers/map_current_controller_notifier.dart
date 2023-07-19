import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/core/mixins/notifire_update_mixin.dart';
import 'package:wb_sweet_sweat/core/utils/logger.dart';
import 'package:wb_sweet_sweat/features/location/application/providers/location_provider.dart';
import 'package:wb_sweet_sweat/features/map/application/notifiers/map_camera_notifier.dart';

part 'map_current_controller_notifier.g.dart';

@riverpod
class MapCurrentControllerNotifier extends _$MapCurrentControllerNotifier
    with NotifierUpdate {
  @override
  GoogleMapController? build() {
    return null;
  }

  void initialize() {
    // locationStreamProvider 값이 변경되면, CameraPosition 을 변경한다.
    ref.listen(
      locationStreamProvider,
      (previous, next) {
        animateToMyLocation();
      },
    );
  }

  void animateToMyLocation() {
    final myLoc = ref.read(mapCameraNotifierProvider.notifier).cameraPosition;
    logger.d('animateToMyLocation::::::::::::: $myLoc');
    if (myLoc != null) {
      state?.animateCamera(
        CameraUpdate.newCameraPosition(myLoc),
      );
    }
  }
}
