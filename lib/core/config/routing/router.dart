import 'dart:io';
import 'package:e_commerce_app/common/models/products_model.dart';
import 'package:e_commerce_app/features/splash.dart';
import 'package:e_commerce_app/features/store/cart/pages/my_cart_page.dart';
import 'package:e_commerce_app/features/store/prdoucts/pages/details_products_page.dart';
import 'package:e_commerce_app/features/store/prdoucts/pages/products_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/pages/login.dart';
import '../../../features/auth/pages/profile.dart';
import '../../../features/auth/pages/registration.dart';
import 'router_config.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class GRouter {
  static GoRouter get router => _router;

  static RouterConfiguration get config => _config;

  static final RouterConfiguration _config = RouterConfiguration.init();

  static final GoRouter _router = GoRouter(
    initialLocation: _config.rootRoute,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
          path: _config.rootRoute,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return _builderPage(
              child: const SplashPage(),
              state: state,
            );
          }),
      GoRoute(
          path: _config.authRoutes.login,
          name: _config.authRoutes.login,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return _builderPage(
              child: const LoginPage(),
              state: state,
            );
          },
          routes: [
            GoRoute(
                path: _config.authRoutes.registration,
                name: _config.authRoutes.registration,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _builderPage(
                    child: const Registration(),
                    state: state,
                  );
                },
                routes: [
                  GoRoute(
                    path: _config.authRoutes.profileScreen,
                    name: _config.authRoutes.profileScreen,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return _builderPage(
                        child: const ProfilePage(),
                        state: state,
                      );
                    },
                  ),
                ]),
          ]),
      GoRoute(
          path: _config.productRoutes.productScreen,
          name: _config.productRoutes.productScreen,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return _builderPage(
              child: const ProductsPage(),
              state: state,
            );
          },
          routes: [
            GoRoute(
                path: _config.productRoutes.productDetails,
                name: _config.productRoutes.productDetails,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _builderPage(
                    child: ProductsDetailsPage(
                      // rating: state.extra as Rating,
                      pro: state.extra as ProductsModel,
                    ),
                    state: state,
                  );
                },
                routes: [
                  GoRoute(
                    path: _config.productRoutes.cart,
                    name: _config.productRoutes.cart,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      final isReview = state.extra as bool? ?? false;
                      return _builderPage(
                        child: MyCartPage(isReview: isReview),
                        state: state,
                      );
                    },
                  ),
                ]),
          ]),
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
