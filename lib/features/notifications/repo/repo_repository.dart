import 'package:dartz/dartz.dart';
import 'package:lween/core/data/data_sources/remote_data_source.dart';
import 'package:lween/core/exceptions/app_exceptions.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/features/notifications/models/notifications.dart';
import 'package:lween/features/notifications/params/notifications_params.dart';
import 'package:lween/features/notifications/repo/irepo_repository.dart';

class NotificationsRepository extends INotificationsRepository {
  RemoteDataSource remoteDataSource;

  NotificationsRepository(this.remoteDataSource);

  @override
  Future<Either<ErrorEntity, NotificationsEntity>> getNotifications(GetNotificationsParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<NotificationsEntity>.fromJson(res,parser: NotificationsEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

}
