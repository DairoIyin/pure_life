import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/features/auth/presentation/forgotPassword/forgot_pswd_screen.dart';
import 'package:pure_life/features/auth/presentation/login/login_screen.dart';
import 'package:pure_life/features/auth/presentation/onboarding/views/onboarding_screen.dart';
import 'package:pure_life/features/auth/presentation/signUp/signup_screen.dart';
import 'package:pure_life/features/cart/presentation/cart_screen.dart';
import 'package:pure_life/features/dashboard/presentation/dashboard_screen.dart';
import 'package:pure_life/features/drug_refill/presentation/drug_refill_screen.dart';
import 'package:pure_life/features/home/presentation/home_screen.dart';
import 'package:pure_life/features/profile/presentation/profile_screen.dart';
import 'package:pure_life/features/shop_and_order/presentation/presentation/shop_and_order.dart';
import 'package:pure_life/features/telehealth/presentation/telehealth_screen.dart';

class AppNavigation {
  AppNavigation._();
  static String initRoute = AppPaths.onboardingScreenPath;
  static final _rootNavKey = GlobalKey<NavigatorState>();
  static final _rootNavHome = GlobalKey<NavigatorState>();
  static final _rootNavShopAndOrder = GlobalKey<NavigatorState>();
  static final _rootNavTeleHealth = GlobalKey<NavigatorState>();
  static final _rootNavCart = GlobalKey<NavigatorState>();
  static final _rootNavProfile = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: initRoute,
      navigatorKey: _rootNavKey,
      routes: <RouteBase>[
        GoRoute(
            name: AppPaths.onboardingScreenName,
            path: AppPaths.onboardingScreenPath,
            builder: (context, state) => OnboardingScreen(),
            routes: [
              GoRoute(
                  path: AppPaths.loginScreenPath,
                  name: AppPaths.loginScreenName,
                  builder: (context, state) => LoginScreen(
                        key: state.pageKey,
                      ),
                  routes: [
                    GoRoute(
                      path: AppPaths.forgotPswdScreenPath,
                      name: AppPaths.forgotPswdScreenName,
                      builder: (context, state) => ForgotPasswordScreen(),
                    ),
                  ]),
              GoRoute(
                name: AppPaths.signUpScreenName,
                path: AppPaths.signUpScreenPath,
                builder: (context, state) => SignupScreen(
                  key: state.pageKey,
                ),
              ),
            ]),
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return DashboardScreen(
                navShell: navigationShell,
              );
            },
            branches: <StatefulShellBranch>[
              StatefulShellBranch(
                  navigatorKey: _rootNavHome,
                  routes: <RouteBase>[
                    GoRoute(
                        path: AppPaths.homeScreenPath,
                        name: AppPaths.homeScreenName,
                        builder: (context, state) => HomeScreen(
                              key: state.pageKey,
                            ),
                        routes: [
                          GoRoute(
                            path: AppPaths.drugRefillPath,
                            name: AppPaths.drugRefillName,
                            builder: (context, state) => DrugRefillScreen(
                              key: state.pageKey,
                            ),
                          )
                        ])
                  ]),
              StatefulShellBranch(navigatorKey: _rootNavShopAndOrder, routes: [
                GoRoute(
                  path: AppPaths.shopAndOrderScreenPath,
                  name: AppPaths.shopAndOrderScreenName,
                  builder: (context, state) => ShopAndOrderScreen(
                    key: state.pageKey,
                  ),
                )
              ]),
              StatefulShellBranch(navigatorKey: _rootNavTeleHealth, routes: [
                GoRoute(
                  path: AppPaths.telehealthScreenPath,
                  name: AppPaths.telehealthScreenName,
                  builder: (context, state) => TeleHealthScreen(
                    key: state.pageKey,
                  ),
                )
              ]),
              StatefulShellBranch(navigatorKey: _rootNavCart, routes: [
                GoRoute(
                  path: AppPaths.cartScreenPath,
                  name: AppPaths.cartScreenName,
                  builder: (context, state) => CartScreen(
                    key: state.pageKey,
                  ),
                )
              ]),
              StatefulShellBranch(navigatorKey: _rootNavProfile, routes: [
                GoRoute(
                  path: AppPaths.profileScreenPath,
                  name: AppPaths.profileScreenName,
                  builder: (context, state) => ProfileScreen(
                    key: state.pageKey,
                  ),
                )
              ]),
            ])
      ]);
}