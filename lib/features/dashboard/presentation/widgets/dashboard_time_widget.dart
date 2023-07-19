import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:wb_sweet_sweat/features/timer/application/providers/timer_controller_provider.dart';
import 'dashboard_item_widget.dart';

class DashboardTimerWidget extends HookConsumerWidget {
  const DashboardTimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerController = ref.watch(timerControllerProvider);
    return StreamBuilder<int>(
      stream: timerController.rawTime,
      initialData: timerController.rawTime.value,
      builder: (context, snap) {
        final value = snap.data;
        final displayTime = StopWatchTimer.getDisplayTime(value!,
            hours: true, milliSecond: false);

        return DashboardItemWidget(title: '시간', value: displayTime);
      },
    );
  }
}
