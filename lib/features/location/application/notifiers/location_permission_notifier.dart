import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/core/mixins/notifire_update_mixin.dart';
import 'package:wb_sweet_sweat/core/utils/logger.dart';
import 'package:wb_sweet_sweat/features/location/application/providers/location_provider.dart';
import 'package:wb_sweet_sweat/features/location/infrastructure/services/location_service.dart';

part 'location_permission_notifier.g.dart';

@riverpod
class LocationPermissionNotifier extends _$LocationPermissionNotifier
    with NotifierUpdate {
  late LocationService locationService;

  @override
  PermissionStatus? build() {
    locationService = ref.watch(locationServiceProvider);
    return null;
  }

  bool get isGranted =>
      state == PermissionStatus.granted || state == PermissionStatus.limited;

  Future<void> enableLocationService() async {
    state = await locationService.enableLocationService();
    logger.d('LocationPermissionNotifier::::::: $state');
  }

  void updateByPermissionStatus(PermissionStatus permission) async {
    state = permission;
    if (permission.isDenied || permission.isRestricted) {
      state = await locationService.requestPermission();
    } else {
      openAppSettings();
    }
  }
}
