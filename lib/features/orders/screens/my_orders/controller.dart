

import 'package:lween/core/controller/base_controller.dart';
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

  refresh() {
    OrdersBloc.instance.add(const GetOrdersEvent());
  }
}