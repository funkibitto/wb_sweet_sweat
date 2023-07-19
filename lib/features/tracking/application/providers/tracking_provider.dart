import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/core/utils/logger.dart';
import 'package:wb_sweet_sweat/features/dashboard/application/notifiers/dashboard_notifier.dart';
import 'package:wb_sweet_sweat/features/map/application/notifiers/map_camera_notifier.dart';
import 'package:wb_sweet_sweat/features/map/application/notifiers/map_current_controller_notifier.dart';
import 'package:wb_sweet_sweat/features/map/application/notifiers/map_polylines_notifier.dart';

part 'tracking_provider.g.dart';

@riverpod
Future<void> trackingController(TrackingControllerRef ref) async {
  ref.watch(dashboardNotifierProvider.notifier).initialize();
  ref.watch(mapCameraNotifierProvider.notifier).initialize();
  ref.watch(mapCurrentControllerNotifierProvider.notifier).initialize();
  ref.watch(mapPolylinesNotifierProvider.notifier).initialize();

  // final isRunningTimer = ref.watch(isRunningTimerNotifierProvider);
  // final timerController = ref.read(timerControllerProvider);ㅋ
  // final dashboardNotifier = ref.read(dashboardNotifierProvider.notifier);
  // final myLocationCameraPositionNotifier =
  //     ref.read(myLocationCameraPositionNotifierProvider.notifier);

  // // await ref
  // //     .read(myLocationCameraPositionNotifierProvider.notifier)
  // //     .initialize();

  // ref.listen(
  //   locationStreamProvider,
  //   (previous, next) {
  //     next.whenData(
  //       (position) {
  //         // if (!isRunningTimer) return;
  //         final milliseconds = timerController.currentRawTime;
  //         dashboardNotifier.calculate(position, milliseconds);
  //         myLocationCameraPositionNotifier.updateByPosition(position);
  //         logger.d(
  //             'trackingController::::::::::::: $position :::::::: ${milliseconds} :::: ${isRunningTimer}');
  //       },
  //     );
  //   },
  // );
}
