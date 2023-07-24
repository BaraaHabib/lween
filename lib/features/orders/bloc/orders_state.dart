part of 'orders_bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState({this.message});
  final String? message;
}

class OrdersInitial extends OrdersState {
  @override
  List<Object> get props => [];
}


//#region my recent orders
abstract class MyRecentOrdersState extends OrdersState {
  const MyRecentOrdersState({String? message}) : super(message: message);
}

class MyRecentOrdersLoading extends MyRecentOrdersState {
  @override
  List<Object?> get props => [];
}

class MyRecentOrdersLoaded extends MyRecentOrdersState {
  const MyRecentOrdersLoaded({required this.ordersResult});
  final OrdersEntity ordersResult;

  @override
  List<Object> get props => [ordersResult];
}

class MyRecentOrdersError extends MyRecentOrdersState {


  const MyRecentOrdersError(String message,) : super(message: message);

  @override
  List<Object?> get props => [message];
}
//#endregion my recent order

//#region all orders
abstract class MyOrdersState extends OrdersState {
  const MyOrdersState({String? message}) : super(message: message);
}

class MyOrdersLoading extends MyOrdersState {
  @override
  List<Object?> get props => [];
}

class MyOrdersLoaded extends MyOrdersState {
  const MyOrdersLoaded({required this.ordersResult});
  final OrdersEntity ordersResult;

  @override
  List<Object> get props => [ordersResult];
}

class MyOrdersError extends MyOrdersState {


  const MyOrdersError(String message,) : super(message: message);

  @override
  List<Object?> get props => [message];
}
//#endregion all order

//#region company travels
abstract class CompanyTravelsState extends OrdersState {
  const CompanyTravelsState({
    String? message,
    this.companyId,
  }) : super(message: message);
  
  final int? companyId;
}

class CompanyTravelsLoading extends CompanyTravelsState {
  @override
  List<Object?> get props => [];

  const CompanyTravelsLoading({super.companyId}) ;
}

class CompanyTravelsLoaded extends CompanyTravelsState {
  const CompanyTravelsLoaded({
    required this.travelsResult,
    super.companyId,
  });
  final TravelsEntity travelsResult;

  @override
  List<Object> get props => [travelsResult];
}

class CompanyTravelsError extends CompanyTravelsState {


  const CompanyTravelsError(
      String message,
      int? companyId,
      ) : super(message: message,companyId: companyId,);

  @override
  List<Object?> get props => [message];
}
//#endregion company travels