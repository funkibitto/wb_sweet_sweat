import 'package:fpdart/fpdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/core/utils/logger.dart';
import 'package:wb_sweet_sweat/features/location/application/providers/location_provider.dart';
import 'package:wb_sweet_sweat/features/map/application/notifiers/map_camera_notifier.dart';
import 'package:wb_sweet_sweat/features/map/infrastructure/services/map_style_service.dart';

part 'map_makers_provider.g.dart';

@riverpod
Option<Marker> mapMarkersMyPosition(MapMarkersMyPositionRef ref) {
  final cameraTarget = ref.watch(mapCameraNotifierProvider)!.target;

  final markerIcon = ref.watch(myLocationMarkerIconProvider).valueOrNull;
  if (markerIcon == null) return const None();

  final myLocationHeading = ref.watch(
    locationStreamProvider.select((position) => position.valueOrNull?.heading),
  );

  final myMarker = MapStyleService.getMyLocationMarker(
    position: cameraTarget,
    rotation: myLocationHeading ?? 0,
    markerIcon: markerIcon,
  );
  return Some<Marker>(myMarker);
}

@riverpod
Future<BitmapDescriptor> myLocationMarkerIcon(
    MyLocationMarkerIconRef ref) async {
  return MapStyleService.getMyLocationMarkerIcon();
}

@riverpod
class MapMarkersNotifier extends _$MapMarkersNotifier {
  @override
  Set<Marker> build() {
    state = {};
    ref.listen<Option<Marker>>(
      mapMarkersMyPositionProvider,
      (previous, next) {
        next.fold(
          () {},
          (marker) {
            _addMarker(marker);
          },
        );
      },
      fireImmediately: true,
    );
    return state;
  }

  _addMarker(Marker marker) {
    final Set<Marker> mapMarkers = Set.from(state);
    //If mapMarkers already has marker with same id,
    //remove it first to avoid adding duplicate markers and replace it instead.
    mapMarkers.removeWhere((m) => m.markerId == marker.markerId);
    mapMarkers.add(marker);

    state = mapMarkers;
  }
}
