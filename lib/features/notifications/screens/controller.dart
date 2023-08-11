


import 'package:flutter/material.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/controller/pagination_mixin.dart';
import 'package:lween/features/notifications/bloc/notifications_bloc.dart';
import 'package:lween/features/notifications/models/notifications.dart';

class NotificationsController extends Controller with PaginationMixin<NotificationEntity>{

  @override
  void init() {
    refresh();
    initPagination(this);
    super.init();
  }

  bool buildWhen(NotificationsState previous, NotificationsState current) {
    return current is GetNotificationsState;
  }

  refresh() {
    NotificationsBloc.instance.add(const GetNotificationsEvent());
  }

  @override
  fetchNextPage(int pageKey) {
      NotificationsBloc.instance.add(GetNotificationsEvent(pageKey,));
  }

  bool listenWhen(NotificationsState previous, NotificationsState current) {
    return current is GetNotificationsState;
  }

  void listener(BuildContext context, NotificationsState state) {
    if(state is GetNotificationsLoaded){
      loadItemsPage(state.notificationsResult.notification ?? [],state.page + 1,);
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}