import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wb_sweet_sweat/core/providers/router/go_router_provider.dart';

const seedColor = Color(0xff00ffff);

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Messenger',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routerConfig: router,
    );
  }
}
