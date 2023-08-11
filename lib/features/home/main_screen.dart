

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom,),
      child: AutoTabsScaffold(
        routes: const [
          MainScreenStackRoute(),
          CompaniesStackRoute(),
          MyOrdersScreenRoute(),
          AccountScreenRoute(),
          NotificationsScreenRoute(),
        ],
        // transitionBuilder: (context,child,Animation<double> animation)=> SliverFadeTransition(
        //   opacity: animation,
        //   // position: ,
        //   // the passed child is technically our animated selected-tab page
        //   sliver: Chli(child: child),
        // ),
        backgroundColor: Styles.navbarBackgroundColor(context),resizeToAvoidBottomInset: false,
        homeIndex: NavTab.notification.index,
        animationDuration: Duration.zero,
        navigatorObservers: () => [
          // NavigationService.navigatorObserver
        ],
        bottomNavigationBuilder: (ctx, TabsRouter tabsRouter) {
          return Consumer<AppStateModel>(
            builder:(ctx, value, child) =>  AppNavWidget(
              index: tabsRouter.activeIndex,
              setActiveIndex : _setActiveIndex,
                tabsRouter: tabsRouter
            ),
          );
        }
      ),
    );
  }

  void _setActiveIndex(int index, {bool notify = false}) {
  }
}

