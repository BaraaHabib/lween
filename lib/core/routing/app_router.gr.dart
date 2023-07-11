// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ResetPasswordScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordScreen(),
      );
    },
    LogInScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LogInScreen(),
      );
    },
    VerifyCodeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyCodeScreenRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyCodeScreen(
          accountId: args.accountId,
          phoneNumber: args.phoneNumber,
          key: args.key,
        ),
      );
    },
    RegisterScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SplashScreenRouteArgs>(
          orElse: () => const SplashScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(key: args.key),
      );
    },
    FullScreenLoaderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FullScreenLoader(),
      );
    },
    MyHomePageRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomePageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyHomePage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    MainScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
  };
}

/// generated route for
/// [ResetPasswordScreen]
class ResetPasswordScreenRoute extends PageRouteInfo<void> {
  const ResetPasswordScreenRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LogInScreen]
class LogInScreenRoute extends PageRouteInfo<void> {
  const LogInScreenRoute({List<PageRouteInfo>? children})
      : super(
          LogInScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyCodeScreen]
class VerifyCodeScreenRoute extends PageRouteInfo<VerifyCodeScreenRouteArgs> {
  VerifyCodeScreenRoute({
    required int accountId,
    required String phoneNumber,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyCodeScreenRoute.name,
          args: VerifyCodeScreenRouteArgs(
            accountId: accountId,
            phoneNumber: phoneNumber,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyCodeScreenRoute';

  static const PageInfo<VerifyCodeScreenRouteArgs> page =
      PageInfo<VerifyCodeScreenRouteArgs>(name);
}

class VerifyCodeScreenRouteArgs {
  const VerifyCodeScreenRouteArgs({
    required this.accountId,
    required this.phoneNumber,
    this.key,
  });

  final int accountId;
  final String phoneNumber;

  final Key? key;

  @override
  String toString() {
    return 'VerifyCodeScreenRouteArgs{accountId: $accountId, key: $key}';
  }
}

/// generated route for
/// [RegisterScreen]
class RegisterScreenRoute extends PageRouteInfo<void> {
  const RegisterScreenRoute({List<PageRouteInfo>? children})
      : super(
          RegisterScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<SplashScreenRouteArgs> {
  SplashScreenRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SplashScreenRoute.name,
          args: SplashScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const PageInfo<SplashScreenRouteArgs> page =
      PageInfo<SplashScreenRouteArgs>(name);
}

class SplashScreenRouteArgs {
  const SplashScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SplashScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [FullScreenLoader]
class FullScreenLoaderRoute extends PageRouteInfo<void> {
  const FullScreenLoaderRoute({List<PageRouteInfo>? children})
      : super(
          FullScreenLoaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'FullScreenLoaderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyHomePage]
class MyHomePageRoute extends PageRouteInfo<MyHomePageRouteArgs> {
  MyHomePageRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          MyHomePageRoute.name,
          args: MyHomePageRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyHomePageRoute';

  static const PageInfo<MyHomePageRouteArgs> page =
      PageInfo<MyHomePageRouteArgs>(name);
}

class MyHomePageRouteArgs {
  const MyHomePageRouteArgs({
    this.key,
    required this.title,
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomePageRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [MainScreen]
class MainScreenRoute extends PageRouteInfo<void> {
  const MainScreenRoute({List<PageRouteInfo>? children})
      : super(
          MainScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
