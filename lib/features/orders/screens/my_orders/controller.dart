

import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';

class MyOrdersController extends Controller{

  @override
  void init() {
    super.init();
    OrdersBloc.instance.add(const GetOrdersEvent());
  }

  bool buildWhen(OrdersState previous, OrdersState current) {
    return current is MyOrdersState;
  }

  bool listenWhen(OrdersState previous, OrdersState current) {
    return current is MyOrdersState;
  }

  refresh() {
    OrdersBloc.instance.add(const GetOrdersEvent());
  }

  void listener(BuildContext context, OrdersState state) {
    if(state is MyOrdersLoaded){
      if(state.navigateToDetails && state.ordersResult.orders?.length == 1) {
        // NavigationService
        //     .of(context)
        //     .closestRouter
        //     .parentAsStackRouter
        //     ?.push(OrderDetailsScreenRoute(order: state.ordersResult.orders!.first,));
        NavigationService.of(context).navigateTo(
            withNavigation: false,
            OrderDetailsScreenRoute(order: state.ordersResult.orders!.first,));
      }
    }
  }
}