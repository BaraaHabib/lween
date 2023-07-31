
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/models/voucher.dart';
import 'package:lween/features/orders/params/check_voucher_params.dart';
import 'package:lween/features/orders/params/create_order_params.dart';
import 'package:lween/features/orders/params/daily_travel_params.dart';
import 'package:lween/features/orders/params/my_orders_params.dart';
import 'package:lween/features/orders/repo/orders_repository.dart';
import 'package:lween/injection_container.dart';


part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final accountRepo = sl<OrdersRepository>();

  static OrdersBloc get instance => sl<OrdersBloc>();

  OrdersBloc() : super(OrdersInitial()) {
    on<GetLatestOrdersEvent>(_latestOrdersEventHandler);
    on<GetOrdersEvent>(_ordersEventHandler);
    on<GetTravelsEvent>(_getTravelsEventHandler);
    on<GetFilteredTravelsEvent>(_getGetFilteredTravelsEventHandler);
    on<CreateOrderEvent>(_createOrderEventHandler);
    on<CheckVoucherEvent>(_checkVoucherEventHandler);
  }


  Future<FutureOr<void>> _latestOrdersEventHandler(GetLatestOrdersEvent event,
      Emitter<OrdersState> emit) async {
    emit(MyRecentOrdersLoading());
    final res = await sl<OrdersRepository>().getMyOrders();
    emit(
      res.fold((l) => MyRecentOrdersError(l.message,),
            (r) => MyRecentOrdersLoaded(ordersResult: r,),
      ),
    );
  }

  Future<FutureOr<void>> _ordersEventHandler(GetOrdersEvent event,
      Emitter<OrdersState> emit) async {
    emit(MyOrdersLoading());
    final res = await sl<OrdersRepository>().getMyOrders(MyOrdersParams(
      page: event.page,
      pageLength: 10,
    ));
    emit(
      res.fold((l) => MyOrdersError(l.message,),
            (r) => MyOrdersLoaded(ordersResult: r,),
      ),
    );
  }

  FutureOr<void> _getTravelsEventHandler(GetTravelsEvent event,
      Emitter<OrdersState> emit) async {
    emit(CompanyTravelsLoading(companyId: event.params?.companyId,));
    final res = await sl<OrdersRepository>().getTravels(event.params,);
    emit(
      res.fold((l) => CompanyTravelsError(l.message, event.params?.companyId,),
            (r) =>
            CompanyTravelsLoaded(
              travelsResult: r, companyId: event.params?.companyId,),
      ),
    );
  }

  Future<FutureOr<void>> _getGetFilteredTravelsEventHandler(
      GetFilteredTravelsEvent event, Emitter<OrdersState> emit) async {
    emit(CompanyFilteredTravelsLoading(
      toCity: event.toCity, fromCity: event.fromCity, date: event.date,),);
    final res = await sl<OrdersRepository>().getTravels(
      TravelParams(
        toCity: event.toCity, 
        fromCity: event.fromCity,
        date: event.date,
        companyId: event.companyId,
      ),
    );
    emit(
      res.fold((l) =>
          CompanyFilteredTravelsError(
            toCity: event.toCity,
            fromCity: event.fromCity,
            date: event.date,
            message: l.errorMessage,
          ),
            (r) =>
            CompanyFilteredTravelsLoaded(
              toCity: event.toCity,
              fromCity: event.fromCity,
              date: event.date,
              travelsResult: r,),
      ),
    );
  }

  Future<FutureOr<void>> _createOrderEventHandler(CreateOrderEvent event, Emitter<OrdersState> emit) async {
    emit(const CreateOrderLoading(),);
    final res = await sl<OrdersRepository>().createOrder(event.params,);
    emit(
      res.fold((l) => CreateOrderError(l.errorMessage ?? ''),
            (r) => CreateOrderLoaded(order: r,),
      ),
    );
  }
  
  Future<FutureOr<void>> _checkVoucherEventHandler(CheckVoucherEvent event, Emitter<OrdersState> emit) async {
    emit(const CheckVoucherLoading(),);
    final res = await sl<OrdersRepository>().checkVoucher(
        CheckVoucherParams(
          code: event.code,
          paymentProvider: event.paymentProvider,
        ),
    );
    emit(
      res.fold((l) => CheckVoucherError(l.errorMessage ?? ''),
            (r) => CheckVoucherLoaded(voucher: r,),
      ),
    );
  }
}
