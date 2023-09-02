



import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/context_ext.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/error_widget.dart';
import 'package:lween/core/widgets/shimmer_ui.dart';
import 'package:lween/features/account/repo/account_repository.dart';
import 'package:lween/features/home/models/home_entity.dart';
import 'package:lween/features/home/screens/home/home_screen_controller.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/widgets/prev_orders.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/features/transportation_entities/screens/widgets/controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/main.dart';
import 'package:provider/provider.dart';

class UpcomingTravelsList extends HookWidget {
  const UpcomingTravelsList({super.key});


  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Controller.getInstance();
    if(AppStateModel.of(context).profile.city?.id == null){
      return const SizedBox.shrink();
    }
    useEffect(() {
      HomeScreenController.getUpcomingTravels();
      return (){};
    },const []);
    return BlocConsumer<OrdersBloc, OrdersState>(
      bloc: OrdersBloc.instance,
      buildWhen: controller.buildUpcomingTravelsWhen,
      listenWhen: controller.listenUpcomingTravelsWhen,
      listener: controller.upcomingTravelsListener,
      builder: (ctx,state) {
        if(state is GetUpcomingTravelsError){
          return AppErrorWidget(
            onAction: () => HomeScreenController.getUpcomingTravels(),
          );
        }
        if(state is GetUpcomingTravelsLoading){
          return const UpcomingTravelsListShimmer();
        }
        if(state is GetUpcomingTravelsLoaded){
          if(controller.upcomingTravels.isNotEmpty) {
            return Column(
              children: [
                // 10.vSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.hx,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppTextWidget(
                        S.of(context).upcomingTrips,
                        style: context.theme.textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ),
                8.vSpace,
                SizedBox(
                  height: 150.hx,
                  child: ListView.separated(
                    // controller: SCc,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsetsDirectional.only(start: 22.wx,),
                    shrinkWrap: true,
                    itemCount: controller.upcomingTravels.length,
                    separatorBuilder: (ctx, index) => SizedBox(width: 18.hx,),
                    itemBuilder: (ctx, index) => _UpcomingTravelWidget(controller.upcomingTravels[index],),
                  ),
                ),
                20.vSpace,
              ],
            );
          }
        }
        return const SizedBox.square();
      },
    );
  }


}

class _UpcomingTravelWidget extends HookWidget{

  final TravelEntity entity;

  const _UpcomingTravelWidget(this.entity);

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Controller.getInstance();
    final textStyle = context.textTheme.titleMedium?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
    return GestureDetector(
      onTap: () {
        controller.startQuickOrder(entity,context,);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AppImage(
                path: Assets.upcomingTravelBgPNG ?? '',
                type: ImageType.asset,
                width: 106.rx,
                height: 105.rx,
                borderRadius: Styles.borderRadius14px,
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    20.vSpace,
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: AppTextWidget(
                          entity.fromCity?.text ?? '',
                          style: textStyle,
                        ),
                      ),
                    ),
                    5.vSpace,
                    SizedBox.square(
                      dimension: 10.rx,
                      child: Transform.rotate(
                        angle: - pi / 2,
                        child: AppImage(
                          path:Assets.doubleArrow,
                          type: ImageType.asset,
                          fit: BoxFit.scaleDown,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    5.vSpace,
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: AppTextWidget(
                          entity.toCity?.text ?? '',
                          style: textStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          5.vSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppImage(
                  path: Assets.upcomingTravelClockSVG,
                  type: ImageType.asset,
                color: AppStateModel.of(context).isLightTheme ? null : Styles.headLineFontColor,
                width: 14.rx,
                height: 14.hx,
              ),
              3.hSpace,
              AppTextWidget(
                entity.travelTime ?? '',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 13.spx,
                ),
                strutStyle: const StrutStyle(
                  height: 1.3,
                ),
              ),
            ],
          ),
          // 5.vSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 2.hSpace,
              AppImage(
                  path: entity.travelMethodEnum.icon,
                  type: ImageType.asset,
                  fit: BoxFit.scaleDown,
                  width: 14.rx,
                  height: 15.hx,
              ),
              3.hSpace,
              AppTextWidget(
                entity.transportationEntity?.name ?? '',
                style: context.textTheme.headlineMedium,
                strutStyle: const StrutStyle(
                  height: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class UpcomingTravelsListShimmer extends StatelessWidget {
  const UpcomingTravelsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.hx,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppTextWidget(
                S.of(context).upcomingTrips,
                style: context.theme.textTheme.headlineLarge,
              ),
            ],
          ),
        ),
        8.vSpace,
        SizedBox(
          height: 150.hx,
          child: ShimmerUI.widgetLoader(
            enabled: true,
            child: ListView.separated(
              // controller: SCc,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsetsDirectional.only(start: 22.wx,),
              shrinkWrap: true,
              itemCount: 4,
              separatorBuilder: (ctx, index) => SizedBox(width: 18.hx,),
              itemBuilder: (ctx, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerUI.circle(
                      105.rx,
                      Styles.borderRadius14px
                  ),
                  5.vSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShimmerUI.circle(
                        14.rx,
                      ),
                      3.hSpace,
                      ShimmerUI.text(w: 50.wx,h: 7.hx),
                    ],
                  ),
                  // 5.vSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 2.hSpace,
                      ShimmerUI.circle(
                        14.rx,
                      ),
                      3.hSpace,
                      ShimmerUI.text(w: 50.wx,h: 7.hx),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        20.vSpace,
      ],
    );
  }
}

