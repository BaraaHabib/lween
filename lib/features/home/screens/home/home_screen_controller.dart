

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/features/home/bloc/home_bloc.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';

class HomeScreenController extends Controller{

  void listener(BuildContext context, HomeState state) {

  }

  bool listenWhen(HomeState previous, HomeState current) {
    return current != previous;
  }

  bool buildWhen(HomeState previous, HomeState current) {
    return current != previous;
  }

  static intiHomeScreen(){
    HomeBloc.instance.add(GetHomeData());
    OrdersBloc.instance.add(const GetLatestOrdersEvent());
  }

  bookATrip(BuildContext context) {
    // Navigator.of(context).pushNamed(OrderFromToScreenRoute.name);
    // AutoRouter.of(context).root.navigate(OrderFromToScreenRoute(),);
    NavigationService.of(context).navigateTo(OrderFromToScreenRoute());
  }
}