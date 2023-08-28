import 'package:dartz/dartz.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/features/repo/irepository.dart';
import 'package:lween/features/notifications/models/notifications.dart';
import 'package:lween/features/notifications/params/notifications_params.dart';

abstract class INotificationsRepository extends IRepository {
  Future<Either<ErrorEntity, NotificationsEntity>> getNotifications(GetNotificationsParams model);

}
