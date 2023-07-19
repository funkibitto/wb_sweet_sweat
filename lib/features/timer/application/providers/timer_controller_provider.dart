import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/features/dashboard/application/notifiers/dashboard_notifier.dart';
import 'package:wb_sweet_sweat/features/map/application/notifiers/map_polylines_notifier.dart';
import 'package:wb_sweet_sweat/features/timer/application/notifiers/is_running_timer_notifier.dart';
import 'package:wb_sweet_sweat/features/timer/service/timer_service.dart';
import 'package:wb_sweet_sweat/features/wakelock/application/providers/wakelock_service_provider.dart';

part 'timer_controller_provider.g.dart';

@riverpod
TimerService timerController(TimerControllerRef ref) {
  final wakelockService = ref.watch(wakelockServiceProvider);
  final isRunningTimer = ref.read(isRunningTimerNotifierProvider.notifier);
  final dashboard = ref.read(dashboardNotifierProvider.notifier);
  final mapPolylines = ref.read(mapPolylinesNotifierProvider.notifier);

  void onStarted() {
    wakelockService.enable();
    isRunningTimer.update((_) => true);
  }

  void onStopped() {
    isRunningTimer.update((_) => false);
    wakelockService.disable();
    dashboard.stopped();
  }

  void onEnded() {
    isRunningTimer.update((_) => false);
    wakelockService.disable();
  }

  void onReset() {
    isRunningTimer.update((_) => false);
    dashboard.reset();
    mapPolylines.reset();
    wakelockService.disable();
  }

  final timerService = TimerService(
    onStarted: () => onStarted(),
    onStopped: () => onStopped(),
    onEnded: () => onEnded(),
    onReset: () => onReset(),
  );

  ref.onDispose(timerService.dispose);

  return timerService;
}
