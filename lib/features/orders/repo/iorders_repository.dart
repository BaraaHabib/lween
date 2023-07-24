import 'package:dartz/dartz.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/features/entities/shared/authenticate.dart';
import 'package:lween/core/features/repo/irepository.dart';
import 'package:lween/features/auth/params/login_params.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/params/daily_travel_params.dart';
import 'package:lween/features/orders/params/my_orders_params.dart';

abstract class IOrdersRepository extends IRepository {
  Future<Either<ErrorEntity, OrdersEntity>> getMyOrders(MyOrdersParams model);
  Future<Either<ErrorEntity, TravelsEntity>> getTravels(TravelParams model);

}
