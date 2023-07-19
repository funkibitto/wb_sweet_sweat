import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wb_sweet_sweat/features/timer/application/notifiers/is_running_timer_notifier.dart';
import 'package:wb_sweet_sweat/features/timer/application/providers/timer_controller_provider.dart';

class DashboardControlWidget extends HookConsumerWidget {
  const DashboardControlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerController = ref.watch(timerControllerProvider);
    final isRunningTimer = ref.watch(isRunningTimerNotifierProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            isRunningTimer
                ? Icons.pause_circle_outline
                : Icons.play_circle_outline,
            color: Colors.black,
            size: 50.0,
          ),
          onPressed: () =>
              isRunningTimer ? timerController.stop() : timerController.start(),
        ),
        IconButton(
          icon: const Icon(
            Icons.restore,
            color: Colors.black,
            size: 50.0,
          ),
          onPressed: () => timerController.reset(),
        ),
      ],
    );
  }
}
