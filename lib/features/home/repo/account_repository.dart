import 'package:dartz/dartz.dart';
import 'package:lween/core/data/data_sources/remote_data_source.dart';
import 'package:lween/core/exceptions/app_exceptions.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/features/home/models/home_entity.dart';
import 'package:lween/features/home/params/home_params.dart';
import 'package:lween/features/home/repo/iaccount_repository.dart';

class HomeRepository extends IHomeRepository {
  final RemoteDataSource _remoteDataSource;

  HomeRepository(this._remoteDataSource);


  @override
  Future<Either<ErrorEntity, HomeEntity>> getHomeData([HomeParams? model]) async {
    try {
      var res = await _remoteDataSource.getRemoteData(model ?? HomeParams(),);
      final data = Entity<HomeEntity>.fromJson(res,parser: HomeEntity.fromJson,);
      // Entity.fromJson(res);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

}
