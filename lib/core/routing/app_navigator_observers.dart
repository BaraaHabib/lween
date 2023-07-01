import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lween/core/navigation/logger.dart';


class AppNavigatorObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    currentRoute = route.settings.name;
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      AppLogger.log('Back from route: ${route.settings.name}');
    }
    _currentRoute = previousRoute?.settings.name;
  }

  String? _currentRoute;
  set currentRoute(String? routeName) {
    _currentRoute = routeName;
    AppLogger.log("Current route is: $_currentRoute", LoggingType.info);
    return;
  }

  String? get currentRoute => _currentRoute;
}
