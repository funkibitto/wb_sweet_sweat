import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wb_sweet_sweat/features/dashboard/application/notifiers/dashboard_notifier.dart';
import 'package:wb_sweet_sweat/features/dashboard/presentation/widgets/dashboard_item_widget.dart';

import 'dashboard_control_widget.dart';
import 'dashboard_time_widget.dart';

class DashboardWidget extends HookConsumerWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardNotifierProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: DashboardControlWidget(),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Divider(
            color: Theme.of(context).colorScheme.onSecondary,
            thickness: 0.5,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Expanded(
              child: DashboardTimerWidget(),
            ),
            Expanded(
              child: DashboardItemWidget(
                title: '속도 km/h',
                value: dashboard.speed.toInt().toString(),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: DashboardItemWidget(
                title: '최고속도',
                value: dashboard.topSpeed.toInt().toString(),
              ),
            ),
            Expanded(
              child: DashboardItemWidget(
                title: '평균속도 km/h',
                value: dashboard.averageSpeed.toInt().toString(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
