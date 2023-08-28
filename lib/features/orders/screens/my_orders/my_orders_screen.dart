

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/empty_widget.dart';
import 'package:lween/core/widgets/error_widget.dart';
import 'package:lween/core/widgets/shimmer_ui.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/screens/my_orders/controller.dart';
import 'package:lween/features/orders/screens/my_orders/widgets/order_item.dart';
import 'package:lween/generated/l10n.dart';

@RoutePage()
class MyOrdersScreen extends HookWidget {
  const MyOrdersScreen({
    super.key,
    this.notCompletedYet,
  });
  final bool? notCompletedYet;

  @override
  Widget build(BuildContext context) {
    MyOrdersController controller =
    Controller.getInstance(
      instance: MyOrdersController(notCompletedYet,),key:notCompletedYet.toString(),);
    return AppScaffold(
      title: (notCompletedYet ?? false) ? S.current.myReservations : S.current.myTickets,
      withBackButton: notCompletedYet ?? false,
      centerTitle: !(notCompletedYet ?? false),
      child: BlocConsumer<OrdersBloc, OrdersState>(
          bloc: OrdersBloc.instance,
          buildWhen: controller.buildWhen,
          listenWhen: controller.listenWhen,
          listener: controller.listener,
          builder: (context, state) {
            return Builder(
                builder: (context) {
                  if (state is MyOrdersLoading) {
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 15.hx),
                      itemCount:  6,
                      itemBuilder: (ctx, index) {return ShimmerUI.widgetLoader(
                        enabled: true,
                        child: OrderItem(
                          item: OrderEntity(),
                          onTap: (){},
                        ),
                      );
                      },
                    );
                    return const WaitingWidget();
                  } else if (state is MyOrdersError) {
                    return AppErrorWidget(
                      message: state.message,
                      actionTitle: S
                          .of(context)
                          .retry,
                      onAction: controller.getData,
                    );
                  }
                  else if (state is MyOrdersLoaded) {
                    if(state.ordersResult.orders?.isEmpty ?? true){
                      return EmptyWidget(
                        imageAssetPath: Assets.noOrdersSVG,
                        entity: S.of(context).reservations,
                        actionTitle: S.current.bookATrip,
                        fullMessage: S.of(context).youHaveNoPreviousReservations,
                        onAction: (){
                          NavigationService
                              .of(context)
                              .navigateTo(OrderFromToScreenRoute());
                        },
                      );
                    }
                    return Stack(
                      children: [
                        RefreshIndicator(
                          onRefresh: () async => controller.getData(),
                          child: Positioned.fill(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 15.hx),
                              itemCount:  state.ordersResult.orders?.length ?? 0,
                              itemBuilder: (ctx, index) {
                                final item = state.ordersResult.orders![index];
                                return OrderItem(
                                  item: item,
                                  onTap: () => NavigationService
                                      .of(context)
                                      .navigateTo(
                                      withNavigation: false,
                                      OrderDetailsScreenRoute(order: item,)),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const EmptyWidget();
                }
            );
          }
      ),
    );
  }
}


@RoutePage()
class MyOrdersStack extends StatelessWidget {
  const MyOrdersStack({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
