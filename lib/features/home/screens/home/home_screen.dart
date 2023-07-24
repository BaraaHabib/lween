

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/empty_widget.dart';
import 'package:lween/core/widgets/error_widget.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/home/bloc/home_bloc.dart';
import 'package:lween/features/home/screens/home/home_screen_controller.dart';
import 'package:lween/features/orders/widgets/prev_orders.dart';
import 'package:lween/features/home/screens/home/widgets/slider.dart';
import 'package:lween/features/home/screens/home/widgets/transportation_entities_list.dart';
import 'package:lween/generated/l10n.dart';

@RoutePage()
class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller =
    Controller.get(instance: HomeScreenController(),);
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: HomeBloc.instance,
        listener: controller.listener,
        listenWhen: controller.listenWhen,
        buildWhen: controller.buildWhen,
        builder: (context, state) {
          return AppScaffold(
            centerTitle: true,
            withBackButton: false,
            padding:EdgeInsets.zero,
            title: AppConfigurations.ApplicationName.toUpperCase(),
            child: Builder(
              builder: (context) {
                if (state is GetHomeDataLoading) {
                  return const WaitingWidget();
                } else if (state is GetHomeDataError) {
                  return AppErrorWidget(
                    message: state.message,
                    actionTitle: S
                        .of(context)
                        .retry,
                    onAction: HomeScreenController.intiHomeScreen,
                  );
                }
                else if (state is GetHomeDataLoaded) {
                  return Stack(
                    children: [
                      RefreshIndicator(
                        onRefresh: () async => HomeScreenController.intiHomeScreen(),
                        child: Positioned.fill(
                          child: ListView(
                            // physics: AlwaysScrollableScrollPhysics(),
                            // addAutomaticKeepAlives: true,
                            // shrinkWrap: true,
                            children: [
                              10.vSpace,
                              if(state.homeEntity.advertisements.isNotEmpty)
                                SizedBox(
                                  width:1.sw,
                                  child: HomeSlider(state.homeEntity.advertisements,),
                                ),
                              15.vSpace,
                              if(state.homeEntity.topCompanies
                                  .isNotEmpty)
                                TopCompaniesList(
                                  state.homeEntity.topCompanies,),
                              const MyPreviousOrders(),
                              50.vSpace,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10.hx,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.wx,),
                            child: AppGradientTextButton(
                              gradientType: AppTextButtonGradientType.secondary,
                              content: S.of(context).bookATrip,
                            ),
                          ),
                      )
                    ],
                  );
                }
                return const EmptyWidget(
                );
              }
            ),
          );
        }
    );
  }
}