import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';
import 'bootstrap.dart';

void main() async {
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: App(),
      // child: Container()
      // child: DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => App(),
      // )),
    ),
  );
}
