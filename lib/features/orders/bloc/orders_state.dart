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
  const MyOrdersLoaded({required this.ordersResult,required this.navigateToDetails,});

  final OrdersEntity ordersResult;
  final bool navigateToDetails;

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

//#region upcoming travels
abstract class GetUpcomingTravelsState extends OrdersState {
  const GetUpcomingTravelsState({
    String? message,
  }) : super(message: message);

}

class GetUpcomingTravelsLoading extends GetUpcomingTravelsState {
  @override
  List<Object?> get props => [];

  const GetUpcomingTravelsLoading() ;
}

class GetUpcomingTravelsLoaded extends GetUpcomingTravelsState {
  const GetUpcomingTravelsLoaded({
    required this.travelsResult,
  });
  final TravelsEntity travelsResult;

  @override
  List<Object> get props => [travelsResult];
}

class GetUpcomingTravelsError extends GetUpcomingTravelsState {


  const GetUpcomingTravelsError(
      String message,
      ) : super(message: message,);

  @override
  List<Object?> get props => [message];
}
//#endregion company travels

//#region filtered travels
abstract class CompanyFilteredTravelsState extends OrdersState {
  const CompanyFilteredTravelsState({
    String? message,
    this.date,
    this.toCity,
    this.fromCity,
    this.companyEntity,
  }) : super(message: message);

  final int? fromCity;
  final int? toCity;
  final int? companyEntity;
  final DateTime? date;

  @override
  List<Object?> get props =>
      [
        if(date != null)
          date,
        if(toCity != null)
          toCity,
        if(fromCity != null)
          fromCity,
        if(companyEntity != null)
          companyEntity,
      ];
}

class CompanyFilteredTravelsLoading extends CompanyFilteredTravelsState {
  const CompanyFilteredTravelsLoading(
      {required super.fromCity, required super.toCity, required super.date,});

}

class CompanyFilteredTravelsLoaded extends CompanyFilteredTravelsState {
  const CompanyFilteredTravelsLoaded(
      {required this.travelsResult, required super.fromCity, required super.toCity, required super.date,});

  final TravelsEntity travelsResult;

}

class CompanyFilteredTravelsError extends CompanyFilteredTravelsState {


  const CompanyFilteredTravelsError(
      {required super.fromCity, required super.toCity, required super.date,required super.message});

}
//#endregion filtered travels

//#region create order
abstract class CreateOrderState extends OrdersState {
  const CreateOrderState({
    String? message,
  }) : super(message: message);

}

class CreateOrderLoading extends CreateOrderState {
  const CreateOrderLoading();

  @override
  List<Object> get props => [];
}

class CreateOrderLoaded extends CreateOrderState {
  const CreateOrderLoaded({
    required this.order,
  });

  final OrderEntity order;

  @override
  List<Object> get props => [];
}

class CreateOrderError extends CreateOrderState {

  const CreateOrderError(String? message): super(message: message);

  @override
  List<Object> get props => [];
}
//#endregion filtered travels

//#region check voucher
abstract class CheckVoucherState extends OrdersState {
  const CheckVoucherState({
    String? message,
  }) : super(message: message);

}

class CheckVoucherLoading extends CheckVoucherState {
  const CheckVoucherLoading();

  @override
  List<Object> get props => [];
}

class CheckVoucherLoaded extends CheckVoucherState {
  const CheckVoucherLoaded({
    required this.voucher,
  });

  final VoucherEntity voucher;

  @override
  List<Object> get props => [];
}

class CheckVoucherError extends CheckVoucherState {

  const CheckVoucherError(String? message): super(message: message);

  @override
  List<Object> get props => [];
}
//#endregion check voucher

//#region cancel order
abstract class CancelOrderState extends OrdersState {
  const CancelOrderState({
    String? message,
  }) : super(message: message);

}

class CancelOrderLoading extends CancelOrderState {
  const CancelOrderLoading();

  @override
  List<Object> get props => [];
}

class CancelOrderLoaded extends CancelOrderState {
  const CancelOrderLoaded();


  @override
  List<Object> get props => [];
}

class CancelOrderError extends CancelOrderState {

  const CancelOrderError(String? message): super(message: message);

  @override
  List<Object> get props => [];
}
//#endregion cancel order

//#region Request Payment
abstract class RequestPaymentState extends OrdersState {
  const RequestPaymentState({
    String? message,
  }) : super(message: message);

}

class RequestPaymentLoading extends RequestPaymentState {
  const RequestPaymentLoading();

  @override
  List<Object> get props => [];
}

class RequestPaymentLoaded extends RequestPaymentState {
  const RequestPaymentLoaded(this.data,);

  final RequestPaymentEntity data;
  @override
  List<Object> get props => [];
}

class RequestPaymentError extends RequestPaymentState {

  const RequestPaymentError(String? message): super(message: message);

  @override
  List<Object> get props => [];
}
//#endregion Request Payment
//#region complete Payment
abstract class CompletePaymentState extends OrdersState {
  const CompletePaymentState({
    String? message,
  }) : super(message: message);

}

class CompletePaymentLoading extends CompletePaymentState {
  const CompletePaymentLoading();

  @override
  List<Object> get props => [];
}

class CompletePaymentLoaded extends CompletePaymentState {
  const CompletePaymentLoaded(this.data,);

  final CompletePaymentEntity data;
  @override
  List<Object> get props => [];
}

class CompletePaymentError extends CompletePaymentState {

  const CompletePaymentError(String? message): super(message: message);

  @override
  List<Object> get props => [];
}
//#endregion complete Payment

//#region Resend Payment Code
abstract class ResendPaymentCodeState extends OrdersState {
  const ResendPaymentCodeState({
    String? message,
  }) : super(message: message);

}

class ResendPaymentCodeLoading extends ResendPaymentCodeState {
  const ResendPaymentCodeLoading();

  @override
  List<Object> get props => [];
}

class ResendPaymentCodeLoaded extends ResendPaymentCodeState {
  const ResendPaymentCodeLoaded();

  @override
  List<Object> get props => [];
}

class ResendPaymentCodeError extends ResendPaymentCodeState {

  const ResendPaymentCodeError(String? message): super(message: message);

  @override
  List<Object> get props => [];
}
//#endregion Resend Payment Code