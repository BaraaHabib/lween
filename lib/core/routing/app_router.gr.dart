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
    CompaniesScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompaniesScreen(),
      );
    },
    CompaniesStackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompaniesStack(),
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
    HomeScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MainScreenStackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreenStack(),
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
    MyTicketsScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyTicketsScreen(),
      );
    },
    NotificationsScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsScreen(),
      );
    },
    NotificationsStackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsStack(),
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
    MyOrdersScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyOrdersScreen(),
      );
    },
    MyOrdersStackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyOrdersStack(),
      );
    },
    OrderSeatsScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderSeatsScreen(),
      );
    },
    OrderTravelsScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderTravelsScreen(),
      );
    },
    OrderPersonInfoScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderPersonInfoScreen(),
      );
    },
    OrderDetailsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsScreenRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderDetailsScreen(
          order: args.order,
          key: args.key,
        ),
      );
    },
    OrderFromToScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OrderFromToScreenRouteArgs>(
          orElse: () => const OrderFromToScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderFromToScreen(
          travelEntity: args.travelEntity,
          companyEntity: args.companyEntity,
          key: args.key,
        ),
      );
    },
    OrderTripPreviewScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OrderTripPreviewScreenRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderTripPreviewScreen(
          key: args.key,
          travelEntity: args.travelEntity,
        ),
      );
    },
    OrderPreviewVehicleScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OrderPreviewVehicleScreenRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderPreviewVehicleScreen(
          key: args.key,
          images: args.images,
        ),
      );
    },
    OrderPaymentMethodScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderPaymentMethodScreen(),
      );
    },
    FullScreenLoaderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FullScreenLoader(),
      );
    },
    AccountScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
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
/// [CompaniesStack]
class CompaniesStackRoute extends PageRouteInfo<void> {
  const CompaniesStackRoute({List<PageRouteInfo>? children})
      : super(
          CompaniesStackRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompaniesStackRoute';

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
/// [MainScreenStack]
class MainScreenStackRoute extends PageRouteInfo<void> {
  const MainScreenStackRoute({List<PageRouteInfo>? children})
      : super(
          MainScreenStackRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainScreenStackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [NotificationsStack]
class NotificationsStackRoute extends PageRouteInfo<void> {
  const NotificationsStackRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsStackRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsStackRoute';

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
/// [MyOrdersStack]
class MyOrdersStackRoute extends PageRouteInfo<void> {
  const MyOrdersStackRoute({List<PageRouteInfo>? children})
      : super(
          MyOrdersStackRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyOrdersStackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderSeatsScreen]
class OrderSeatsScreenRoute extends PageRouteInfo<void> {
  const OrderSeatsScreenRoute({List<PageRouteInfo>? children})
      : super(
          OrderSeatsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderSeatsScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderTravelsScreen]
class OrderTravelsScreenRoute extends PageRouteInfo<void> {
  const OrderTravelsScreenRoute({List<PageRouteInfo>? children})
      : super(
          OrderTravelsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderTravelsScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderPersonInfoScreen]
class OrderPersonInfoScreenRoute extends PageRouteInfo<void> {
  const OrderPersonInfoScreenRoute({List<PageRouteInfo>? children})
      : super(
          OrderPersonInfoScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderPersonInfoScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderDetailsScreen]
class OrderDetailsScreenRoute
    extends PageRouteInfo<OrderDetailsScreenRouteArgs> {
  OrderDetailsScreenRoute({
    required OrderEntity order,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrderDetailsScreenRoute.name,
          args: OrderDetailsScreenRouteArgs(
            order: order,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailsScreenRoute';

  static const PageInfo<OrderDetailsScreenRouteArgs> page =
      PageInfo<OrderDetailsScreenRouteArgs>(name);
}

class OrderDetailsScreenRouteArgs {
  const OrderDetailsScreenRouteArgs({
    required this.order,
    this.key,
  });

  final OrderEntity order;

  final Key? key;

  @override
  String toString() {
    return 'OrderDetailsScreenRouteArgs{order: $order, key: $key}';
  }
}

/// generated route for
/// [OrderFromToScreen]
class OrderFromToScreenRoute extends PageRouteInfo<OrderFromToScreenRouteArgs> {
  OrderFromToScreenRoute({
    TravelEntity? travelEntity,
    CompanyEntity? companyEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrderFromToScreenRoute.name,
          args: OrderFromToScreenRouteArgs(
            travelEntity: travelEntity,
            companyEntity: companyEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderFromToScreenRoute';

  static const PageInfo<OrderFromToScreenRouteArgs> page =
      PageInfo<OrderFromToScreenRouteArgs>(name);
}

class OrderFromToScreenRouteArgs {
  const OrderFromToScreenRouteArgs({
    this.travelEntity,
    this.companyEntity,
    this.key,
  });

  final TravelEntity? travelEntity;

  final CompanyEntity? companyEntity;

  final Key? key;

  @override
  String toString() {
    return 'OrderFromToScreenRouteArgs{travelEntity: $travelEntity, companyEntity: $companyEntity, key: $key}';
  }
}

/// generated route for
/// [OrderTripPreviewScreen]
class OrderTripPreviewScreenRoute
    extends PageRouteInfo<OrderTripPreviewScreenRouteArgs> {
  OrderTripPreviewScreenRoute({
    Key? key,
    required TravelEntity travelEntity,
    List<PageRouteInfo>? children,
  }) : super(
          OrderTripPreviewScreenRoute.name,
          args: OrderTripPreviewScreenRouteArgs(
            key: key,
            travelEntity: travelEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderTripPreviewScreenRoute';

  static const PageInfo<OrderTripPreviewScreenRouteArgs> page =
      PageInfo<OrderTripPreviewScreenRouteArgs>(name);
}

class OrderTripPreviewScreenRouteArgs {
  const OrderTripPreviewScreenRouteArgs({
    this.key,
    required this.travelEntity,
  });

  final Key? key;

  final TravelEntity travelEntity;

  @override
  String toString() {
    return 'OrderTripPreviewScreenRouteArgs{key: $key, travelEntity: $travelEntity}';
  }
}

/// generated route for
/// [OrderPreviewVehicleScreen]
class OrderPreviewVehicleScreenRoute
    extends PageRouteInfo<OrderPreviewVehicleScreenRouteArgs> {
  OrderPreviewVehicleScreenRoute({
    Key? key,
    required List<String?> images,
    List<PageRouteInfo>? children,
  }) : super(
          OrderPreviewVehicleScreenRoute.name,
          args: OrderPreviewVehicleScreenRouteArgs(
            key: key,
            images: images,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderPreviewVehicleScreenRoute';

  static const PageInfo<OrderPreviewVehicleScreenRouteArgs> page =
      PageInfo<OrderPreviewVehicleScreenRouteArgs>(name);
}

class OrderPreviewVehicleScreenRouteArgs {
  const OrderPreviewVehicleScreenRouteArgs({
    this.key,
    required this.images,
  });

  final Key? key;

  final List<String?> images;

  @override
  String toString() {
    return 'OrderPreviewVehicleScreenRouteArgs{key: $key, images: $images}';
  }
}

/// generated route for
/// [OrderPaymentMethodScreen]
class OrderPaymentMethodScreenRoute extends PageRouteInfo<void> {
  const OrderPaymentMethodScreenRoute({List<PageRouteInfo>? children})
      : super(
          OrderPaymentMethodScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderPaymentMethodScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
