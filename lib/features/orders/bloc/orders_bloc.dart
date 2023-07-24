
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/params/daily_travel_params.dart';
import 'package:lween/features/orders/params/my_orders_params.dart';
import 'package:lween/features/orders/repo/orders_repository.dart';
import 'package:lween/injection_container.dart';


part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final accountRepo = sl<OrdersRepository>();

  static OrdersBloc get instance => sl<OrdersBloc>();

  OrdersBloc() : super(OrdersInitial()){
    on<GetLatestOrdersEvent>(_latestOrdersEventHandler);
    on<GetOrdersEvent>(_ordersEventHandler);
    on<GetTravelsEvent>(_getTravelsEventHandler);
  }


  Future<FutureOr<void>> _latestOrdersEventHandler(GetLatestOrdersEvent event, Emitter<OrdersState> emit) async {
    emit(MyRecentOrdersLoading());
    final res = await sl<OrdersRepository>().getMyOrders();
    emit(
        res.fold((
            l) => MyRecentOrdersError(l.message,),
                (r) => MyRecentOrdersLoaded(ordersResult: r,),
          ),
    );
  }

  Future<FutureOr<void>> _ordersEventHandler(GetOrdersEvent event, Emitter<OrdersState> emit) async {
    emit(MyOrdersLoading());
    final res = await sl<OrdersRepository>().getMyOrders(MyOrdersParams(
      page: event.page,
      pageLength: 10,
    ));
    emit(
      res.fold((
          l) => MyOrdersError(l.message,),
            (r) => MyOrdersLoaded(ordersResult: r,),
      ),
    );
  }

  FutureOr<void> _getTravelsEventHandler(GetTravelsEvent event, Emitter<OrdersState> emit) async {
    emit(CompanyTravelsLoading(companyId: event.companyId,));
    final res = await sl<OrdersRepository>().getTravels(TravelParams(
      page: event.page,
      pageLength: 20,
      transportationEntityId: event.companyId,
    ));
    emit(
      res.fold((
          l) => CompanyTravelsError(l.message,event.companyId),
            (r) => CompanyTravelsLoaded(travelsResult: r,companyId: event.companyId,),
      ),
    );
  }
}
