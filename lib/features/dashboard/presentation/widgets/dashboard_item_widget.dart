import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardItemWidget extends HookConsumerWidget {
  final String title;
  final String value;

  const DashboardItemWidget({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color textColor = Theme.of(context).colorScheme.onSecondary;
    return SizedBox(
      width: 100,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: textColor.withAlpha(200),
                fontSize: 15,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: textColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
