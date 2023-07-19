import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/core/utils/logger.dart';
import 'package:wb_sweet_sweat/features/location/application/providers/location_provider.dart';
import 'package:wb_sweet_sweat/features/timer/application/notifiers/is_running_timer_notifier.dart';

part 'map_polylines_notifier.g.dart';

@riverpod
class MapPolylinesNotifier extends _$MapPolylinesNotifier {
  Position? position;

  @override
  Set<Polyline> build() {
    state = {};
    return state;
  }

  reset() {
    state = {};
  }

  void initialize() {
    final isRunningTimerNotifier =
        ref.read(isRunningTimerNotifierProvider.notifier);
    logger.d('MapPolylinesNotifier::::::::::::: initialize');

    ref.listen(
      locationStreamProvider,
      (previous, next) {
        next.whenData(
          (position) {
            if (!isRunningTimerNotifier.isRunning) return;
            logger.d('MapPolylinesNotifier::::::::::::: $position');
            add(position);
          },
        );
      },
    );
  }

  add(Position newPosition) {
    if (position != null) {
      LatLng pos1 = LatLng(position!.latitude, position!.longitude);
      LatLng pos2 = LatLng(newPosition.latitude, newPosition.longitude);
      final polyline = Polyline(
        polylineId: PolylineId(pos2.toString()),
        color: Colors.deepPurpleAccent,
        width: 5,
        points: [pos1, pos2],
      );
      state.add(polyline);
    }
    position = newPosition;

    // logger.d('MapPolylines::::::::::::: ${state.length}');
  }
}
