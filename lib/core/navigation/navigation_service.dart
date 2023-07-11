import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/core/routing/app_router.dart';

import 'package:lween/core/routing/app_navigator_observers.dart';

class NavigationService {
  final BuildContext _context;
  NavigationService._(this._context);

  factory NavigationService.of(BuildContext context) {
    return NavigationService._(context);
  }

  static AppNavigatorObserver navigatorObserver = AppNavigatorObserver();

  BuildContext get context => _context;

  StackRouter get router => context.router;

  // use with splashPage to restart
  Future clearAllAndPushNamed(PageRouteInfo route) async {
    // boolean to indicate we are restarting app, reset in splash

    if (route is SplashScreenRoute) {
      AppLogger.log('Restarting');
      AppStateModel.isRestartingApp = true;
    }
    router.popUntilRoot();
    // router.popUntil((route) => route.isFirst,);
    await router.replace(
      route,
    );
    if (route is SplashScreenRoute) {
      AppLogger.log('App restarted');
    }
  }

  void restart() => clearAllAndPushNamed(SplashScreenRoute());

  Future<dynamic> navigateTo(PageRouteInfo route) async {
    return await router.push(route, onFailure: (NavigationFailure f) {
      AppLogger.log('${f.runtimeType} --- $f', LoggingType.error);
    });
  }

  until(bool Function(Route) predicate) => router.popUntil(predicate);

  popUntilRoot() => router.popUntilRoot();
  popUntilRout(String routeName) => router.popUntilRouteWithName(routeName,);

  Future<Object?> replace(PageRouteInfo route) async {
    return await router.replace(route, onFailure: (NavigationFailure f) {
      AppLogger.log('${f.runtimeType} --- $f', LoggingType.error);
    });
  }

  Future<Object?> popAndPush(PageRouteInfo route) async {
    return await router.popAndPush(route, onFailure: (NavigationFailure f) {
      AppLogger.log('${f.runtimeType} --- $f', LoggingType.error);
    });
  }

  Future<Object?> pop([Object? result]) async {
    return await router.pop(result);
  }
}
