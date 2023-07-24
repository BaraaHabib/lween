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
  const GetTravelsEvent({this.page = 0,this.companyId});
  final int page;
  final int? companyId;

  @override
  List<Object?> get props => [];
}

