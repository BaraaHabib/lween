

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/features/account/repo/account_repository.dart';
import 'package:lween/features/home/bloc/home_bloc.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/daily_travels.dart';

class HomeScreenController extends Controller {

  void listener(BuildContext context, HomeState state) {

  }

  bool listenWhen(HomeState previous, HomeState current) {
    return current != previous;
  }

  bool buildWhen(HomeState previous, HomeState current) {
    return current != previous;
  }

  static intiHomeScreen() {
    HomeBloc.instance.add(GetHomeData());
    OrdersBloc.instance.add(const GetLatestOrdersEvent());
    getUpcomingTravels();
  }

  bookATrip(BuildContext context) {
    NavigationService.of(context).navigateTo(OrderFromToScreenRoute());
  }

  List<TravelEntity> upcomingTravels = [];

  static void getUpcomingTravels() {
    if (AccountRepository.profile?.city?.id != null) {
      OrdersBloc.instance.add(GetUpcomingTravelsEvent(
        cityId: AccountRepository.profile!.city!.id!,));
    }
  }

  bool buildUpcomingTravelsWhen(OrdersState previous, OrdersState current) {
    return current is GetUpcomingTravelsState;
  }

  bool listenUpcomingTravelsWhen(OrdersState previous, OrdersState current) {
    return current is GetUpcomingTravelsState;
  }

  void upcomingTravelsListener(BuildContext context, OrdersState state) {
    if (state is GetUpcomingTravelsLoaded) {
      upcomingTravels = state.travelsResult.travels ?? [];
    }
  }
}