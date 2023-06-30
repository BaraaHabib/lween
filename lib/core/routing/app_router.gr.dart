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
    SignInScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
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
  };
}

/// generated route for
/// [SignInScreen]
class SignInScreenRoute extends PageRouteInfo<void> {
  const SignInScreenRoute({List<PageRouteInfo>? children})
      : super(
          SignInScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
