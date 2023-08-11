

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/shimmer_ui.dart';
import 'package:lween/features/notifications/models/notifications.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/generated/l10n.dart';

class NotificationItemWidget extends HookWidget {
  const NotificationItemWidget({
    required this.item,
    super.key,
  });

  final NotificationEntity item;

  @override
  Widget build(BuildContext context) {
    final controller = Controller.getInstance(instance: NotificationController(item,),key: item.id.toString(),);
    Color? color;
    if(!controller.item.isViewed!){
      color = Styles.unreadNotificationColor(context);
    }
    else{
      color = context.theme.cardTheme.color;
    }

    return InkWell(
      onTap: () => controller.onTap(context),
      splashColor:  context.theme.primaryColor.withOpacity(0.7),
      child: Container(
        width: 1.sw,
        padding: EdgeInsetsDirectional.only(
          start: 20.wx,
          top: 6.hx,
          bottom: 14.hx,
          end: 18.wx,
        ),
        decoration: BoxDecoration(
          color: color,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage(
              path: controller.item.imageUrl,
              type: ImageType.cachedNetwork,
              width: 60.rx,
              height: 60.rx,
              borderRadius: BorderRadius.circular(50),
            ),
            10.hSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextWidget(
                        controller.item.title ?? '',
                        style: context.textTheme.titleMedium,
                      ),
                      AppTextWidget(
                        controller.item.formattedTime ?? '',
                      ),
                    ],
                  ),
                  // Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: AppTextWidget(
                            controller.item.description ?? '',
                            maxLines: 3,
                            style: context.textTheme.bodyMedium,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItemSkeleton extends StatelessWidget {
  const NotificationItemSkeleton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsetsDirectional.only(
        start: 20.wx,
        top: 6.hx,
        bottom: 14.hx,
        end: 18.wx,
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          ShimmerUI.circle(60.rx),
          // AppImage(
          //   path: item.imageUrl,
          //   type: ImageType.cachedNetwork,
          //   width: 60.rx,
          //   height: 60.rx,
          //   borderRadius: BorderRadius.circular(50),
          // ),
          10.hSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerUI.text(),
                  ],
                ),
                // Spacer(),
                10.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ShimmerUI.text(w: 180.wx,)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationController extends Controller{
  final NotificationEntity item;

  NotificationController(this.item);

  @override
  init(){
    super.init();
    // Future.delayed(1.seconds).then((value) {
    //   item.isViewed = true;
    // });
  }

  void onTap(BuildContext context) {
    switch (item.eventType ?? 1) {
      case 2:
      case 3:
      case 4:
      case 5:
        NavigationService.of(context).closestRouter.navigate(const MyOrdersStackRoute());
      case 1:
      default:

    }
  }
}