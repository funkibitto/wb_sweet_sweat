import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wb_sweet_sweat/features/dashboard/application/notifiers/dashboard_notifier.dart';

class DashboardDistanceWidget extends HookConsumerWidget {
  const DashboardDistanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final distance = ref.watch(
        dashboardNotifierProvider.select((value) => value.distanceString));

    Color textColor = Theme.of(context).colorScheme.onPrimary;

    return Container(
      width: 160,
      height: 60,
      decoration: BoxDecoration(
        // color: Colors.green.withOpacity(0.85),
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      // padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            distance,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
