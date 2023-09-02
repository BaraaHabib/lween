

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';

class MyOrdersController extends Controller {

  MyOrdersController(this.notCompletedYet);

  final bool? notCompletedYet;

  @override
  void init() {
    super.init();
    getData();
  }

  bool buildWhen(OrdersState previous, OrdersState current) {
    return current is MyOrdersState;
  }

  bool listenWhen(OrdersState previous, OrdersState current) {
    return current is MyOrdersState;
  }

  getData() {
    OrdersBloc.instance.add(
      GetOrdersEvent(
        notCompletedYet: notCompletedYet,
      ),
    );
  }

  void listener(BuildContext context, OrdersState state) {
  }
}