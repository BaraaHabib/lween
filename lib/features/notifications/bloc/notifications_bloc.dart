
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lween/features/notifications/models/notifications.dart';
import 'package:lween/features/notifications/params/notifications_params.dart';
import 'package:lween/features/notifications/repo/irepo_repository.dart';
import 'package:lween/features/notifications/repo/repo_repository.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/models/coupon.dart';
import 'package:lween/features/orders/params/cancel_order_params.dart';
import 'package:lween/features/orders/params/check_coupon_params.dart';
import 'package:lween/features/orders/params/create_order_params.dart';
import 'package:lween/features/orders/params/daily_travel_params.dart';
import 'package:lween/features/orders/params/my_orders_params.dart';
import 'package:lween/features/orders/repo/orders_repository.dart';
import 'package:lween/injection_container.dart';


part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final notificationsRepo = sl<NotificationsRepository>();

  static NotificationsBloc get instance => sl<NotificationsBloc>();

  NotificationsBloc() : super(NotificationsInitial()) {
    on<GetNotificationsEvent>(_notificationsEventHandler);
  }


  Future<FutureOr<void>> _notificationsEventHandler(GetNotificationsEvent event,
      Emitter<NotificationsState> emit) async {
    emit(GetNotificationsLoading(page: event.page,));
    final res = await sl<NotificationsRepository>().getNotifications(
      GetNotificationsParams(
        page: event.page,
      ),
    );
    emit(
      res.fold((l) => GetNotificationsError(l.message, page: event.page),
            (r) =>
            GetNotificationsLoaded(notificationsResult: r, page: event.page,),
      ),
    );
  }
}
