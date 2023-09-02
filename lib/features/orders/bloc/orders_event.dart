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
  const GetOrdersEvent({
    this.page = 0,
    this.ids,
    this.notCompletedYet,
  });

  final List<String>? ids;
  final int page;
  final bool? notCompletedYet;

  @override
  List<Object?> get props => [];
}

class GetTravelsEvent extends OrdersEvent {
  const GetTravelsEvent({this.params});
  final TravelParams? params;

  @override
  List<Object?> get props => [];
}
class GetUpcomingTravelsEvent extends OrdersEvent {
  const GetUpcomingTravelsEvent({required this.cityId,});
  final int cityId;

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

class CheckCouponEvent extends OrdersEvent {
  const CheckCouponEvent({
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
class RequestPaymentEvent extends OrdersEvent {
  const RequestPaymentEvent({
    required this.params,
  });

  final RequestPaymentParams params;

  @override
  List<Object?> get props => [];
}
class CompletePaymentEvent extends OrdersEvent {
  const CompletePaymentEvent({
    required this.params,
  });

  final CompletePaymentParams params;

  @override
  List<Object?> get props => [];
}

class ResendPaymentCodeEvent extends OrdersEvent {
  const ResendPaymentCodeEvent({
    required this.accountNumber,
    required this.paymentType,
    required this.transactionId,
  });

  final String accountNumber;
  final PaymentMethod paymentType;
  final String transactionId;

  @override
  List<Object?> get props => [];
}

class RefreshAvailableSeatsEvent extends OrdersEvent {
  const RefreshAvailableSeatsEvent({
    required this.params,
  });

  final AvailableSeatsParams params;

  @override
  List<Object?> get props => [];
}