part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();
}
class GetLatestOrdersEvent extends OrdersEvent {
  const GetLatestOrdersEvent();

  @override
  List<Object?> get props => [];
}

class GetOrdersEvent extends OrdersEvent {
  const GetOrdersEvent([this.page = 0]);
  final int page;

  @override
  List<Object?> get props => [];
}

class GetTravelsEvent extends OrdersEvent {
  const GetTravelsEvent({this.params});
  final TravelParams? params;

  @override
  List<Object?> get props => [];
}
class GetFilteredTravelsEvent extends OrdersEvent {
  const GetFilteredTravelsEvent({
     this.date,
     this.toCity,
     this.fromCity,
     this.companyId,
     this.ids,
  });

  final int? fromCity;
  final int? toCity;
  final int? companyId;
  final DateTime? date;
  final List<String>? ids;

  @override
  List<Object?> get props => [];
}
class CreateOrderEvent extends OrdersEvent {
  const CreateOrderEvent({
    required this.params,
  });

  final CreateOrderParams params;

  @override
  List<Object?> get props => [];
}

class CheckVoucherEvent extends OrdersEvent {
  const CheckVoucherEvent({
    this.paymentProvider,
    required this.code,
  });

  final String code;
  final int? paymentProvider;

  @override
  List<Object?> get props => [];
}

class CancelOrderEvent extends OrdersEvent {
  const CancelOrderEvent({
    required this.orderId,
  });

  final String orderId;

  @override
  List<Object?> get props => [];
}