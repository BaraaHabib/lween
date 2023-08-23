
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/features/orders/models/complete_payment.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/models/request_payment.dart';
import 'package:lween/features/orders/models/voucher.dart';
import 'package:lween/features/orders/params/cancel_order_params.dart';
import 'package:lween/features/orders/params/check_voucher_params.dart';
import 'package:lween/features/orders/params/complete_payment_params.dart';
import 'package:lween/features/orders/params/create_order_params.dart';
import 'package:lween/features/orders/params/daily_travel_params.dart';
import 'package:lween/features/orders/params/my_orders_params.dart';
import 'package:lween/features/orders/params/request_payment_params.dart';
import 'package:lween/features/orders/params/resend_payment_code_params.dart';
import 'package:lween/features/orders/params/upcoming_travel_params.dart';
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
    on<GetFilteredTravelsEvent>(_getFilteredTravelsEventHandler);
    on<GetUpcomingTravelsEvent>(_getUpcomingTravelsEventHandler);
    on<CreateOrderEvent>(_createOrderEventHandler);
    on<CheckVoucherEvent>(_checkVoucherEventHandler);
    on<CancelOrderEvent>(_cancelOrderEventHandler);
    on<RequestPaymentEvent>(_requestPaymentEventHandler);
    on<CompletePaymentEvent>(_completePaymentEventHandler);
    on<ResendPaymentCodeEvent>(_resendPaymentCodeEventHandler);
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
    final res = await sl<OrdersRepository>().getMyOrders(
      MyOrdersParams(
        page: event.page,
        pageLength: 10,
        ids:event.ids,
        notCompletedYet:event.notCompletedYet,
      ),
    );
    emit(
      res.fold((l) => MyOrdersError(l.message,),
            (r) => MyOrdersLoaded(ordersResult: r,navigateToDetails: event.navigateToDetails,),
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

  Future<FutureOr<void>> _getFilteredTravelsEventHandler(
      GetFilteredTravelsEvent event, Emitter<OrdersState> emit) async {
    emit(CompanyFilteredTravelsLoading(
      toCity: event.toCity, fromCity: event.fromCity, date: event.date,),);
    final res = await sl<OrdersRepository>().getTravels(
      TravelParams(
        toCity: event.toCity,
        fromCity: event.fromCity,
        date: event.date,
        companyId: event.companyId,
        ids: event.ids ?? [],
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

  Future<FutureOr<void>> _createOrderEventHandler(CreateOrderEvent event,
      Emitter<OrdersState> emit) async {
    emit(const CreateOrderLoading(),);
    final res = await sl<OrdersRepository>().createOrder(event.params,);
    emit(
      res.fold((l) => CreateOrderError(l.errorMessage),
            (r) => CreateOrderLoaded(order: r,),
      ),
    );
  }

  Future<FutureOr<void>> _checkVoucherEventHandler(CheckVoucherEvent event,
      Emitter<OrdersState> emit) async {
    emit(const CheckVoucherLoading(),);
    final res = await sl<OrdersRepository>().checkVoucher(
      CheckVoucherParams(
        code: event.code,
        paymentProvider: event.paymentProvider,
      ),
    );
    emit(
      res.fold((l) => CheckVoucherError(l.errorMessage),
            (r) => CheckVoucherLoaded(voucher: r,),
      ),
    );
  }

  Future<FutureOr<void>> _cancelOrderEventHandler(CancelOrderEvent event,
      Emitter<OrdersState> emit) async {
    emit(const CancelOrderLoading(),);
    final res = await sl<OrdersRepository>().cancelOrder(
        CancelOrderParams(orderId: event.orderId));
    emit(
      res.fold((l) => CancelOrderError(l.errorMessage),
            (r) => const CancelOrderLoaded(),
      ),
    );
  }

  Future<FutureOr<void>> _requestPaymentEventHandler(RequestPaymentEvent event, Emitter<OrdersState> emit) async {
    emit(const RequestPaymentLoading(),);
    final res = await sl<OrdersRepository>().requestPayment(event.params,);
    emit(
      res.fold((l) => RequestPaymentError(l.errorMessage),
            (r) => RequestPaymentLoaded(r,),
      ),
    );
  }

  Future<FutureOr<void>> _resendPaymentCodeEventHandler(ResendPaymentCodeEvent event, Emitter<OrdersState> emit) async {
    emit(const ResendPaymentCodeLoading(),);
    final res = await sl<OrdersRepository>().resendPaymentCode(
      ResendPaymentCodeParams(body: ResendPaymentCodeParamsBody(
        accountNumber: event.accountNumber,
        paymentType: event.paymentType,
        transactionId: event.transactionId,
      ),
      ),
    );
    emit(
      res.fold((l) => ResendPaymentCodeError(l.errorMessage),
            (r) => const ResendPaymentCodeLoaded(),
      ),
    );
  }

  refreshOrders(){
    add(const GetLatestOrdersEvent(),);
    add(const GetOrdersEvent(),);
  }



  Future<FutureOr<void>> _completePaymentEventHandler(CompletePaymentEvent event, Emitter<OrdersState> emit) async {
    emit(const CompletePaymentLoading(),);
    final res = await sl<OrdersRepository>().completePayment(event.params,);
    emit(
      res.fold((l) => CompletePaymentError(l.errorMessage),
            (r) => CompletePaymentLoaded(r,),
      ),
    );
  }

  Future<FutureOr<void>> _getUpcomingTravelsEventHandler(GetUpcomingTravelsEvent event, Emitter<OrdersState> emit) async {
    emit(const GetUpcomingTravelsLoading(),);
    final res = await sl<OrdersRepository>().getUpcomingTravels(
      GetUpcomingTravelsParams(
        cityId: event.cityId,
      ),
    );
    emit(
      res.fold((l) =>
          GetUpcomingTravelsError(l.errorMessage),
            (r) =>
            GetUpcomingTravelsLoaded(
              travelsResult: r,),
      ),
    );
  }
}
