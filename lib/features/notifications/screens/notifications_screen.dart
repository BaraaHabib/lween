

import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/empty_widget.dart';
import 'package:lween/core/widgets/error_widget.dart';
import 'package:lween/core/widgets/shimmer_ui.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/notifications/bloc/notifications_bloc.dart';
import 'package:lween/features/notifications/models/notifications.dart';
import 'package:lween/features/notifications/screens/controller.dart';
import 'package:lween/features/notifications/screens/widgets/notification_item.dart';
import 'package:lween/generated/l10n.dart';

@RoutePage()
class NotificationsScreen extends HookWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationsController controller = Controller.getInstance(instance: NotificationsController(),);
    return AppScaffold(
      title: S.current.notifications,
      withBackButton: false,
      centerTitle: true,
      padding: EdgeInsetsDirectional.only(
          start: 0.wx,
          end: 0.wx
      ),
      child: BlocConsumer<NotificationsBloc, NotificationsState>(
          bloc: NotificationsBloc.instance,
          buildWhen: controller.buildWhen,
          listenWhen: controller.listenWhen,
          listener: controller.listener,
          builder: (context, state) {
            return Builder(
                builder: (context) {
                  if (state is GetNotificationsLoading && state.page == 0) {
                    return ShimmerUI.widgetLoader(
                      enabled: true,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 15.hx),
                        itemCount:  6,
                        separatorBuilder: (ctx, index) =>
                            Divider(height: 0,color: Styles.liteGrayColor.withOpacity(0.5,),),
                        itemBuilder: (ctx, index) {
                          return const NotificationItemSkeleton();
                        },
                      ),
                    );
                  } else if (state is GetNotificationsError) {
                    return AppErrorWidget(
                      message: state.message,
                      actionTitle: S
                          .of(context)
                          .retry,
                      onAction: controller.refresh,
                    );
                  }
                    if(controller.pagingController.itemList?.isEmpty ?? true){
                      return EmptyWidget(
                        entity: S.current.notifications,
                      );
                    }
                    return Stack(
                      children: [
                        RefreshIndicator(
                          onRefresh: () async => controller.refresh(),
                          child: Positioned.fill(
                            child: PagedListView.separated(
                              shrinkWrap: true,
                              scrollController: controller.scrollController,
                              pagingController: controller.pagingController,
                              padding: EdgeInsets.only(top: 15.hx),
                              // itemCount:  controller.notificationsResult.length,

                              separatorBuilder: (ctx, index) =>
                                  Divider(height: 0,color: Styles.liteGrayColor.withOpacity(0.5,),),
                              builderDelegate: PagedChildBuilderDelegate<NotificationEntity>(
                                itemBuilder: (context, item, index) {
                                  // controller.pagingController.
                                  return Column(
                                    children: [
                                      NotificationItemWidget(
                                        item: item,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                }
            );
          }
      ),
    );

  }
}


@RoutePage()
class NotificationsStack extends StatelessWidget {
  const NotificationsStack({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
