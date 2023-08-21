import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lween/features/account/screens/account/account_screen.dart';
import 'package:lween/features/account/screens/account_settings/account_settings_screen.dart';
import 'package:lween/features/account/screens/login_screen.dart';
import 'package:lween/features/account/screens/reset_password_screen.dart';
import 'package:lween/features/account/screens/register_screen.dart';
import 'package:lween/features/account/screens/verify_code_screen.dart';
import 'package:lween/features/home/main_screen.dart';
import 'package:lween/features/home/screens/home/home_screen.dart';
import 'package:lween/features/notifications/screens/notifications_screen.dart';
import 'package:lween/features/onboarding/screens/splash.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/screens/my_orders/my_orders_screen.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_details_screen.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_from_to_screen.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_payment_method_screen.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_payment_webview_screen.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_person_info_screen.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_preview_vehicle_screen.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_seats_screen.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_travels_screen.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_trip_preview_screen.dart';
import 'package:lween/features/tickets/screens/my_tickets.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/features/transportation_entities/screens/company_profile/company_profile_screen.dart';
import 'package:lween/features/transportation_entities/screens/company_profile/controller.dart';
import 'package:lween/features/transportation_entities/screens/companies_screen.dart';
import 'package:lween/features/webview/webview.dart';
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
        page: LogInScreenRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: RegisterScreenRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: VerifyCodeScreenRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: ResetPasswordScreenRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: MainScreenRoute.page,
        path: '/${MainScreenRoute.name}',
        transitionsBuilder: TransitionsBuilders.fadeIn,
        children: [
          CustomRoute(
            page: MainScreenStackRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            children: [
              CustomRoute(
                path: '',
                transitionsBuilder: TransitionsBuilders.fadeIn,
                page: HomeScreenRoute.page,
              ),
              // CustomRoute(
              //   path: CompanyProfileScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: CompanyProfileScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderFromToScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderFromToScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderSeatsScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderSeatsScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderPersonInfoScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderPersonInfoScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderPaymentMethodScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderPaymentMethodScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderTravelsScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderTravelsScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderDetailsScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderDetailsScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderTripPreviewScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderTripPreviewScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderPreviewVehicleScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderPreviewVehicleScreenRoute.page,
              // ),
            ],
          ),
          CustomRoute(
            path: CompaniesStackRoute.name,
            page: CompaniesStackRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            children: [
              CustomRoute(
                path: '',
                transitionsBuilder: TransitionsBuilders.fadeIn,
                page: CompaniesScreenRoute.page,
              ),
              // CustomRoute(
              //   path: CompanyProfileScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: CompanyProfileScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderFromToScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderFromToScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderSeatsScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderSeatsScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderPersonInfoScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderPersonInfoScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderPaymentMethodScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderPaymentMethodScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderTravelsScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderTravelsScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderDetailsScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderDetailsScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderTripPreviewScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderTripPreviewScreenRoute.page,
              // ),
              // CustomRoute(
              //   path: OrderPreviewVehicleScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderPreviewVehicleScreenRoute.page,
              // ),
            ],
          ),

          CustomRoute(
            path: NotificationsStackRoute.name,
            page: NotificationsStackRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            children: [
              CustomRoute(
                path: '',
                transitionsBuilder: TransitionsBuilders.fadeIn,
                page: NotificationsScreenRoute.page,
              ),
            ],
          ),
          CustomRoute(page: AccountScreenRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
          ),
          CustomRoute(
            page: MyOrdersStackRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            children: [
              CustomRoute(
                path: '',
                transitionsBuilder: TransitionsBuilders.fadeIn,
                page: MyOrdersScreenRoute.page,
              ),
              // CustomRoute(
              //   path: OrderDetailsScreenRoute.name,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              //   page: OrderDetailsScreenRoute.page,
              // ),
            ],
          ),
        ]
    ),
    CustomRoute(page: AppWebViewRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,),
    CustomRoute(page: PaymentWebViewScreenRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: OrderPreviewVehicleScreenRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: OrderDetailsScreenRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: CompanyProfileScreenRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: OrderFromToScreenRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: OrderSeatsScreenRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: OrderPersonInfoScreenRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: OrderPaymentMethodScreenRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: OrderTravelsScreenRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: OrderTripPreviewScreenRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: AccountSettingsScreenRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: MyOrdersScreenRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      page: CompaniesScreenRoute.page,
    ),
  ];

}