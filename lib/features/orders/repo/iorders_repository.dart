import 'package:dartz/dartz.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/features/entities/shared/authenticate.dart';
import 'package:lween/core/features/repo/irepository.dart';
import 'package:lween/features/account/models/check_code_entity.dart';
import 'package:lween/features/account/params/login_params.dart';
import 'package:lween/features/orders/models/complete_payment.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/models/request_payment.dart';
import 'package:lween/features/orders/models/coupon.dart';
import 'package:lween/features/orders/params/available_seats_params.dart';
import 'package:lween/features/orders/params/cancel_order_params.dart';
import 'package:lween/features/orders/params/check_coupon_params.dart';
import 'package:lween/features/orders/params/complete_payment_params.dart';
import 'package:lween/features/orders/params/create_order_params.dart';
import 'package:lween/features/orders/params/daily_travel_params.dart';
import 'package:lween/features/orders/params/my_orders_params.dart';
import 'package:lween/features/orders/params/request_payment_params.dart';
import 'package:lween/features/orders/params/resend_payment_code_params.dart';
import 'package:lween/features/orders/params/upcoming_travel_params.dart';

abstract class IOrdersRepository extends IRepository {
  Future<Either<ErrorEntity, OrdersEntity>> getMyOrders(MyOrdersParams model);
  Future<Either<ErrorEntity, TravelsEntity>> getTravels(TravelParams model);
  Future<Either<ErrorEntity, TravelsEntity>> getUpcomingTravels(GetUpcomingTravelsParams model);
  Future<Either<ErrorEntity, OrderEntity>> createOrder(CreateOrderParams model);
  Future<Either<ErrorEntity, EmptyEntity>> cancelOrder(CancelOrderParams model);
  Future<Either<ErrorEntity, CouponEntity>> checkCoupon(CheckCouponParams model);
  Future<Either<ErrorEntity, RequestPaymentEntity>> requestPayment(RequestPaymentParams model);
  Future<Either<ErrorEntity, CompletePaymentEntity>> completePayment(CompletePaymentParams model);
  Future<Either<ErrorEntity, EmptyEntity>> resendPaymentCode(ResendPaymentCodeParams model);
  Future<Either<ErrorEntity, AvailableSeatsEntity>> getAvailableSeats(AvailableSeatsParams model);

}
