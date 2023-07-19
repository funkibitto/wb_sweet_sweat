import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wb_sweet_sweat/features/location/application/providers/location_provider.dart';
import 'package:wb_sweet_sweat/features/map/application/notifiers/map_current_controller_notifier.dart';
import 'package:wb_sweet_sweat/features/map/application/notifiers/map_polylines_notifier.dart';
import 'package:wb_sweet_sweat/features/map/application/notifiers/map_camera_notifier.dart';
import 'package:wb_sweet_sweat/features/map/application/providers/map_makers_provider.dart';

class GoogleMapWidget extends HookConsumerWidget {
  GoogleMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapCurrentController =
        ref.watch(mapCurrentControllerNotifierProvider.notifier);

    final locationAsync = ref.watch(
      //Using select to avoid rebuilding when location change
      locationStreamProvider.select((value) => value.whenData((value) => true)),
    );

    final isShowAsync =
        ref.watch(mapCameraNotifierProvider.select((value) => value != null));

    return isShowAsync
        ? GoogleMap(
            cameraTargetBounds: CameraTargetBounds.unbounded,
            initialCameraPosition: ref.watch(mapCameraNotifierProvider)!,
            mapType: MapType.normal,
            compassEnabled: true,
            myLocationEnabled: false,
            polylines: ref.watch(mapPolylinesNotifierProvider), //polylin
            markers: ref.watch(mapMarkersNotifierProvider),
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            onMapCreated: (controller) async {
              final mapStyle = await DefaultAssetBundle.of(context)
                  .loadString('assets/map_styles/dark.json');

              await controller.setMapStyle(mapStyle);
              mapCurrentController.update((_) => controller);
            },
          )
        : const Center(
            child: CircularProgressIndicator(),
          );

    // return locationAsync.when(
    //   skipLoadingOnReload: true,
    //   skipLoadingOnRefresh: !locationAsync.hasError,
    //   loading: () => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    //   error: (error, st) => const Center(
    //     child: Text('error'),
    //   ),
    //   data: (_) => GoogleMap(
    //     cameraTargetBounds: CameraTargetBounds.unbounded,
    //     initialCameraPosition:
    //         ref.watch(myLocationCameraPositionNotifierProvider)!,
    //     mapType: MapType.normal,
    //     compassEnabled: true,
    //     myLocationEnabled: false,
    //     polylines: ref.watch(mapPolylinesNotifierProvider), //polylin
    //     markers: ref.watch(mapMarkersNotifierProvider),
    //     zoomControlsEnabled: false,
    //     myLocationButtonEnabled: false,
    //     onMapCreated: (controller) async {
    //       final mapStyle = await DefaultAssetBundle.of(context)
    //           .loadString('assets/map_styles/dark.json');

    //       await controller.setMapStyle(mapStyle);
    //       mapCurrentController.update((_) => controller);
    //     },
    //   ),
    // );
  }
}
