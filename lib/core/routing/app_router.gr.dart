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
    AppWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<AppWebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AppWebView(
          key: args.key,
          url: args.url,
        ),
      );
    },
    MainScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
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
    HomeScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MyTicketsScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyTicketsScreen(),
      );
    },
    AccountScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
    NotificationsScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsScreen(),
      );
    },
    MyOrdersScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyOrdersScreen(),
      );
    },
    CompanyProfileScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CompanyProfileScreenRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompanyProfileScreen(
          companyEntity: args.companyEntity,
          key: args.key,
        ),
      );
    },
    CompaniesScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompaniesScreen(),
      );
    },
    CompaniesRoutesScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompaniesRoutesScreen(),
      );
    },
  };
}

/// generated route for
/// [AppWebView]
class AppWebViewRoute extends PageRouteInfo<AppWebViewRouteArgs> {
  AppWebViewRoute({
    Key? key,
    required String url,
    List<PageRouteInfo>? children,
  }) : super(
          AppWebViewRoute.name,
          args: AppWebViewRouteArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'AppWebViewRoute';

  static const PageInfo<AppWebViewRouteArgs> page =
      PageInfo<AppWebViewRouteArgs>(name);
}

class AppWebViewRouteArgs {
  const AppWebViewRouteArgs({
    this.key,
    required this.url,
  });

  final Key? key;

  final String url;

  @override
  String toString() {
    return 'AppWebViewRouteArgs{key: $key, url: $url}';
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
    return 'VerifyCodeScreenRouteArgs{accountId: $accountId, phoneNumber: $phoneNumber, key: $key}';
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
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute({List<PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyTicketsScreen]
class MyTicketsScreenRoute extends PageRouteInfo<void> {
  const MyTicketsScreenRoute({List<PageRouteInfo>? children})
      : super(
          MyTicketsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTicketsScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountScreen]
class AccountScreenRoute extends PageRouteInfo<void> {
  const AccountScreenRoute({List<PageRouteInfo>? children})
      : super(
          AccountScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationsScreen]
class NotificationsScreenRoute extends PageRouteInfo<void> {
  const NotificationsScreenRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyOrdersScreen]
class MyOrdersScreenRoute extends PageRouteInfo<void> {
  const MyOrdersScreenRoute({List<PageRouteInfo>? children})
      : super(
          MyOrdersScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyOrdersScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyProfileScreen]
class CompanyProfileScreenRoute
    extends PageRouteInfo<CompanyProfileScreenRouteArgs> {
  CompanyProfileScreenRoute({
    required CompanyEntity companyEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CompanyProfileScreenRoute.name,
          args: CompanyProfileScreenRouteArgs(
            companyEntity: companyEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CompanyProfileScreenRoute';

  static const PageInfo<CompanyProfileScreenRouteArgs> page =
      PageInfo<CompanyProfileScreenRouteArgs>(name);
}

class CompanyProfileScreenRouteArgs {
  const CompanyProfileScreenRouteArgs({
    required this.companyEntity,
    this.key,
  });

  final CompanyEntity companyEntity;

  final Key? key;

  @override
  String toString() {
    return 'CompanyProfileScreenRouteArgs{companyEntity: $companyEntity, key: $key}';
  }
}

/// generated route for
/// [CompaniesScreen]
class CompaniesScreenRoute extends PageRouteInfo<void> {
  const CompaniesScreenRoute({List<PageRouteInfo>? children})
      : super(
          CompaniesScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompaniesScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompaniesRoutesScreen]
class CompaniesRoutesScreenRoute extends PageRouteInfo<void> {
  const CompaniesRoutesScreenRoute({List<PageRouteInfo>? children})
      : super(
          CompaniesRoutesScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompaniesRoutesScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
