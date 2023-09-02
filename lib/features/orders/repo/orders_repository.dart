import 'package:dartz/dartz.dart';
import 'package:lween/core/data/data_sources/remote_data_source.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
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
import 'package:lween/features/orders/repo/iorders_repository.dart';
import '../../../../core/exceptions/app_exceptions.dart';

class OrdersRepository extends IOrdersRepository {
  RemoteDataSource remoteDataSource;

  OrdersRepository(this.remoteDataSource);

  @override
  Future<Either<ErrorEntity, OrdersEntity>> getMyOrders(
      [MyOrdersParams? model]) async {
    try {
      var res = await remoteDataSource.getRemoteData(
        model ?? MyOrdersParams(),);
      final data = Entity<OrdersEntity>.fromJson(
        res, parser: OrdersEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, TravelsEntity>> getTravels(
      [TravelParams? model]) async {
    try {
      var res = await remoteDataSource.getRemoteData(model ?? TravelParams(),);
      final data = Entity<TravelsEntity>.fromJson(
        res, parser: TravelsEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, OrderEntity>> createOrder(
      CreateOrderParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<OrderEntity>.fromJson(
        res, parser: OrderEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, CouponEntity>> checkCoupon(
      CheckCouponParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<CouponEntity>.fromJson(
        res, parser: CouponEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, EmptyEntity>> cancelOrder(
      CancelOrderParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<EmptyEntity>.fromJson(
        res, parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, RequestPaymentEntity>> requestPayment(
      RequestPaymentParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<RequestPaymentEntity>.fromJson(
        res, parser: RequestPaymentEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, EmptyEntity>> resendPaymentCode(
      ResendPaymentCodeParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<EmptyEntity>.fromJson(
        res, parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, CompletePaymentEntity>> completePayment(
      CompletePaymentParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<CompletePaymentEntity>.fromJson(
        res, parser: CompletePaymentEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, TravelsEntity>> getUpcomingTravels(GetUpcomingTravelsParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<TravelsEntity>.fromJson(
        res, parser: TravelsEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, AvailableSeatsEntity>> getAvailableSeats(AvailableSeatsParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<AvailableSeatsEntity>.fromJson(
        res, parser: AvailableSeatsEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }
}