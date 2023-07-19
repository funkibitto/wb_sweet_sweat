import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/core/utils/logger.dart';
import 'package:wb_sweet_sweat/features/dashboard/domain/entities/dashboard.dart';
import 'package:wb_sweet_sweat/features/location/application/providers/location_provider.dart';
import 'package:wb_sweet_sweat/features/timer/application/notifiers/is_running_timer_notifier.dart';
import 'package:wb_sweet_sweat/features/timer/application/providers/timer_controller_provider.dart';
import 'package:wb_sweet_sweat/features/timer/service/timer_service.dart';

part 'dashboard_notifier.g.dart';

@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  int speedCount = 0;
  int lastMilliseconds = 0;
  double speedTotal = 0;

  @override
  Dashboard build() {
    return const Dashboard(
      speed: 0,
      calorie: 0,
      topSpeed: 0,
      distance: 0,
      averageSpeed: 0,
      position: null,
    );
  }

  void initialize() {
    final isRunningTimerNotifier =
        ref.read(isRunningTimerNotifierProvider.notifier);
    final timerController = ref.read(timerControllerProvider);

    ref.listen(
      locationStreamProvider,
      (previous, next) {
        next.whenData(
          (position) {
            if (!isRunningTimerNotifier.isRunning) return;
            final milliseconds = timerController.currentRawTime;
            calculate(position, milliseconds);
          },
        );
      },
    );
  }

  reset() {
    state = const Dashboard(
      speed: 0,
      calorie: 0,
      topSpeed: 0,
      distance: 0,
      averageSpeed: 0,
      position: null,
    );
    speedCount = 0;
    lastMilliseconds = 0;
    speedTotal = 0;
  }

  stopped() {
    state = state.copyWith(
      speed: 0,
      position: null,
    );
    print('stopped :::: ${state.toString()}');
  }

  calculate(Position position, int milliseconds) {
    double speed = 0;
    double averageSpeed = state.averageSpeed;
    double topSpeed = state.topSpeed;
    double distance = state.distance;
    Position? lastPosition = state.position;

    speed = (position.speed * 18 / 5);
    speed = speed > 0 ? speed : 0;
    topSpeed = speed > topSpeed ? speed : topSpeed;

    int timeDuration = (milliseconds - lastMilliseconds);

    if (lastPosition != null) {
      logger.d('calculate :::: speedCount:::: ${speedCount}');

      final newDistance = Geolocator.distanceBetween(
        lastPosition.latitude,
        lastPosition.longitude,
        position.latitude,
        position.longitude,
      );

      // average Speed
      // distance
      distance = distance + newDistance;
      if (timeDuration > 0) {
        speedCount++;
        speedTotal = speedTotal + speed;
        averageSpeed = speedTotal / speedCount;
      }
    }

    Dashboard dashboard = Dashboard(
      speed: speed,
      calorie: 0,
      topSpeed: topSpeed,
      distance: distance,
      averageSpeed: averageSpeed,
      position: position,
    );

    logger.d(
        'calculate :::: dashboard:::: ${dashboard.toString()} ::::  speedCount :: $speedCount');

    update(dashboard);
  }

  update(Dashboard dashboard) {
    state = dashboard;
  }
}
