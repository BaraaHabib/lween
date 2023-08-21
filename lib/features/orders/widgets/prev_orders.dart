

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/trip_card_widget.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/empty_widget.dart';
import 'package:lween/core/widgets/error_widget.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

class MyPreviousOrders extends HookWidget {
  const MyPreviousOrders({
    super.key});
  @override
  Widget build(BuildContext context) {
    final OrdersController controller = Controller.getInstance();
    return BlocBuilder<OrdersBloc,OrdersState>(
      bloc: sl<OrdersBloc>(),
      buildWhen: controller.buildWhen,
      builder: (context, state) {
        if(state is MyRecentOrdersError){
          return AppErrorWidget(
            topMargin: 30,
            actionTitle: S.current.retry,
            onAction: controller.getOrders,
            message: S.of(context).reservations,
          );
        }
        else if(state is MyRecentOrdersError){
          return AppErrorWidget(
            onAction: controller.getOrders,
            message: S.of(context).reservations,
          );
        }else if(state is MyRecentOrdersLoaded){
          final orders = state.ordersResult.orders ?? [];
          if(orders.isEmpty){
            return const SizedBox.shrink();
          }
          return Padding(
            padding: EdgeInsets.only(left: 18.wx,right: 18.wx,top: 20.hx,),
            child: Column(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                Row(
                  children: [
                    AppTextWidget(
                      S.of(context).previousTrips
                      ,style: context.theme.textTheme.headlineLarge,
                    ),
                  ],
                ),
                12.vSpace,
                ListView.separated(
                  itemCount: orders.length ,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (ctx,index) => 12.hSpace,
                  itemBuilder: (ctx,index) {
                    final item = orders[index];
                    return TripCard(
                      subtitle: item.transportationCompany?.text ?? '',
                      date: item.formattedTravelTimeDate,
                      from: item.fromCity?.text ?? '',
                      to: item.toCity?.text ?? '',
                      imageUrl: Assets.tripOrderIcon(context,),
                      onTap: () {
                        NavigationService.of(context).navigateTo(
                          withNavigation: false,
                          OrderDetailsScreenRoute(order: item,),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        }
        return Container();
      }
    );
  }
}

class OrdersController extends Controller{

  @override
  void init() {
    super.init();
    getOrders();
  }

  bool buildWhen(OrdersState previous, OrdersState current) {
    return current is MyRecentOrdersState;
  }

  getOrders() {
    OrdersBloc.instance.add(const GetLatestOrdersEvent());
  }
}
