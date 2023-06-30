import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lween/core/loaders/loading_overlay.dart';
import 'package:lween/features/auth/screens/login.dart';
import 'package:lween/features/auth/screens/signup.dart';
import 'package:lween/features/onboarding/screens/splash.dart';
import 'package:lween/main.dart';


part 'app_router.gr.dart';
part 'transitions.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
/// To add new route
/// 1- add your page as other pages are added
/// 2- run the following command in terminal:
///  flutter packages pub run build_runner build --delete-conflicting-outputs
///
final barrierColor = Colors.white.withAlpha(50);

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route,Screen',
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter(GlobalKey<NavigatorState> navigatorKey)
      : super(navigatorKey: navigatorKey);

  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashScreenRoute.page, path: '/'),
    CustomRoute(
        page: SignInScreenRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: RegisterScreenRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn),
  ];
}
