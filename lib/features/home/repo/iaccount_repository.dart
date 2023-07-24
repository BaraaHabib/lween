import 'package:dartz/dartz.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/features/repo/irepository.dart';
import 'package:lween/features/home/models/home_entity.dart';
import 'package:lween/features/home/params/home_params.dart';

abstract class IHomeRepository extends IRepository {
  Future<Either<ErrorEntity, HomeEntity>> getHomeData(HomeParams model);

}
