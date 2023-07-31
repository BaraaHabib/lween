

import 'package:flutter/src/widgets/framework.dart';
import 'package:lween/core/controller/base_controller.dart';
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
}