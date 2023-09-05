import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/auth/presentation/pages/registration.dart';
import '../../../features/auth/presentation/pages/login.dart';
import 'router_config.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class GRouter {
  static GoRouter get router => _router;

  static RouterConfiguration get config => _config;

  static final RouterConfiguration _config = RouterConfiguration.init();

  static final GoRouter _router = GoRouter(
    initialLocation: _config.kRootRoute,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      // GoRoute(
      //     path: _config.kRootRoute,
      //     pageBuilder: (BuildContext context, GoRouterState state) {
      //       return _builderPage(
      //         child: const SplashScreen(),
      //         state: state,
      //       );
      //     }),
      GoRoute(
        path: _config.kRootRoute,
        // name: _config.authRoutes.login,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: LoginScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: _config.authRoutes.registration,
        name: _config.authRoutes.registration,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: const Registration(),
            state: state,
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Container(),
  );

  static Page<dynamic> _builderPage<T>(
      {required Widget child, required GoRouterState state}) {
    if (Platform.isIOS) {
      return CupertinoPage<T>(child: child, key: state.pageKey);
    } else {
      return MaterialPage<T>(child: child, key: state.pageKey);
    }
  }
}
