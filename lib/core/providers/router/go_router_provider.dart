import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/features/auth/presentation/pages/login_page.dart';
import 'package:wb_sweet_sweat/features/location/application/providers/location_provider.dart';
import 'package:wb_sweet_sweat/features/location/presentation/pages/no_permission_page.dart';

import 'package:wb_sweet_sweat/features/home/presentation/pages/home_page.dart';
import 'package:wb_sweet_sweat/features/tracking/presentation/pages/tracking_page.dart';
import 'package:wb_sweet_sweat/core/constants/global_key.dart';
import 'package:wb_sweet_sweat/core/widgets/scaffold_with_nav_bar.dart';

part 'go_router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final locationPermission = ref.watch(locationPermissionStateProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    // initialLocation: '/tracking',
    initialLocation: '/auth/login',
    routes: [
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/location/noPermission',
        builder: (context, state) => const NoPermissionPage(),
      ),
      GoRoute(
        path: '/tracking',
        builder: (context, state) => const TrackingPage(),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
          return NoTransitionPage(child: ScaffoldWithNavBar(child: child));
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey, child: const HomePage()),
          ),
        ],
      )
    ],
    redirect: (BuildContext context, GoRouterState state) {
      if (locationPermission != LocationPermission.whileInUse &&
          locationPermission != LocationPermission.always) {
        return '/location/noPermission';
      }
      return null;
    },
  );
}
