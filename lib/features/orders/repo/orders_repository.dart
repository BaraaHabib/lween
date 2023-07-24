import 'package:dartz/dartz.dart';
import 'package:lween/core/data/data_sources/remote_data_source.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/params/daily_travel_params.dart';
import 'package:lween/features/orders/params/my_orders_params.dart';
import 'package:lween/features/orders/repo/iorders_repository.dart';
import '../../../../core/exceptions/app_exceptions.dart';

class OrdersRepository extends IOrdersRepository {
  RemoteDataSource remoteDataSource;

  OrdersRepository(this.remoteDataSource);

  @override
  Future<Either<ErrorEntity, OrdersEntity>> getMyOrders([MyOrdersParams? model]) async {
    try {
      var res = await remoteDataSource.getRemoteData(model ?? MyOrdersParams(),);
      final data = Entity<OrdersEntity>.fromJson(res,parser: OrdersEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }
  @override
  Future<Either<ErrorEntity, TravelsEntity>> getTravels([TravelParams? model]) async {
    try {
      var res = await remoteDataSource.getRemoteData(model ?? TravelParams(),);
      final data = Entity<TravelsEntity>.fromJson(res,parser: TravelsEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

}
