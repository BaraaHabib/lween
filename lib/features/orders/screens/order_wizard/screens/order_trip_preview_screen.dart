

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/generated/l10n.dart';


@RoutePage()
class OrderTripPreviewScreen extends StatelessWidget {
  const OrderTripPreviewScreen({
    super.key,
    required this.travelEntity,
  });

  final TravelEntity travelEntity;


  @override
  Widget build(BuildContext context) {
    final EdgeInsetsDirectional padding = EdgeInsetsDirectional.only(
        start: 22.wx,
        end: 18.wx
    );
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: AppImage(
            path: _getGIF,
            fit: BoxFit.fitWidth,
            width: 1.sw,
            // height: 180.hx,
            type: ImageType.asset,
          ),
        ),
        SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                12.vSpace,
                Padding(
                  padding: padding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // AutoTabsRouter.of(context).pop();
                          NavigationService
                              .of(context)
                              .pop();
                        },
                        child: Assets.previousIconWidget(context,forceTheme: ThemeType.light,),
                      ),
                      // 24.hSpace,
                    ],
                  ),
                ),
                 SizedBox(
                   height: 80.hx,
                 ),
                 Expanded(
                   child: Container(
                     width: 1.sw,
                     padding: EdgeInsetsDirectional.only(
                         start: 15.wx,
                         end: 10.wx,
                     ),
                     decoration: BoxDecoration(
                       color: context.theme.cardTheme.color,
                       borderRadius: BorderRadius.vertical(
                         top: Styles.circularBorderRadius20px,
                       ),
                     ),
                     child: Container(
                       padding: const EdgeInsetsDirectional.only(start: 10),
                       width: 0.9.sw,
                       child: SingleChildScrollView(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             20.vSpace,
                             Container(
                               width: 50.wx,
                               height: 4.hx,
                               decoration: BoxDecoration(
                                 color: Styles.liteGrayColor.withOpacity(0.3,),
                                 borderRadius: Styles.borderRadius14px,
                               ),
                             ),
                             30.vSpace,
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Expanded(
                                   flex:12,
                                   child: _FromToWidget(
                                     label: S.current.startFrom,
                                     text: travelEntity.fromCity?.text ?? '',
                                     subText: travelEntity.startLocation ?? '',
                                   ),
                                 ),
                                 Expanded(
                                   flex:12,
                                   child: _FromToWidget(
                                     label: S.current.destination,
                                     text: travelEntity.toCity?.text ?? '',
                                     subText: travelEntity.destinationLocation ?? '',
                                   ),
                                 ),
                               ],
                             ),
                             30.vSpace,
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Expanded(
                                   flex:12,
                                   child: _LabelWithWidget(
                                     label: S.of(context).availableDays,
                                     text: travelEntity.availableDaysText ?? '',
                                     icon: Assets.calendarSVG,
                                   ),
                                 ),
                                 // const Expanded(
                                 //   flex:2,
                                 //   child: SizedBox(),
                                 // ),
                                 Expanded(
                                   flex:12,
                                   child: _LabelWithWidget(
                                     label: S.of(context).tripTime,
                                     text: travelEntity.travelTime ?? '',
                                     icon: Assets.clockSVG,
                                   ),
                                 ),
                               ],
                             ),
                             30.vSpace,
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Expanded(
                                   flex:12,
                                   child: _LabelWithWidget(
                                     label: S.of(context).transportationType,
                                     text: "${travelEntity.travelMethodText ?? ''} ${(travelEntity.isVip ?? false) ? '- VIP' : ''}",
                                     icon: Assets.microbusPNG,
                                   ),
                                 ),
                                 // const Expanded(
                                 //   flex:2,
                                 //   child: SizedBox(),
                                 // ),
                                 Expanded(
                                   flex:12,
                                   child: Row(
                                     children: [
                                       const Spacer(flex: 1),
                                       Expanded(
                                         flex: 5,
                                         child: SizedBox(
                                           // height: 30.hx,
                                           // width: 90.wx,
                                           child: AppGradientTextButtonWithIcon(
                                             content: S
                                                 .of(context)
                                                 .previewVehicle,
                                             onTap: () {
                                               return NavigationService
                                                 .of(context,)
                                                  .navigateTo(OrderPreviewVehicleScreenRoute(images: travelEntity.images ?? []));
                                             },
                                             fontSize: 11.spx,
                                             icon: Assets.eyeSVG,
                                             padding: const EdgeInsets.symmetric(
                                                 horizontal: 15, vertical: 0),
                                           ),
                                         ),
                                       ),
                                       const Spacer(flex: 1),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                             30.vSpace,
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Expanded(
                                   child: _LabelWithWidget(
                                     label: S.of(context).travelDuration,
                                     text: travelEntity.travelDuration ?? '',
                                     icon: Assets.clockSVG,
                                   ),
                                 ),
                               ],
                             ),
                             30.vSpace,
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10.hx,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.wx,),
            child: AppGradientTextButton(
              gradientType: AppTextButtonGradientType.secondary,
              content: S.of(context).bookATrip,
              onTap: () {
                NavigationService.of(context).navigateTo(OrderFromToScreenRoute(travelEntity: travelEntity,));
              },
            ),
          ),
        )
      ],
    );
  }

  String get _getGIF {
    if(travelEntity.travelMethodEnum == VehicleType.bus){
      if(travelEntity.isVip ?? false){
        return Assets.busVIPGIF;
      }
      return Assets.busGIF;
    }
    else if(travelEntity.travelMethodEnum == VehicleType.microbus){
      return Assets.microbusGIF;
    }
    if(travelEntity.travelMethodEnum == VehicleType.van){
      return Assets.vanGIF;
    }
    if(travelEntity.travelMethodEnum == VehicleType.car){
      return Assets.carGIF;
    }
    return Assets.carGIF;
  }
}

class _FromToWidget extends StatelessWidget{
  final String? image;
  final String label;
  final String text;
  final String subText;

  const _FromToWidget({
    super.key,
    this.image,
    required this.label,
    required this.text,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.hx,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextWidget(
                label,
                style: context
                    .textTheme
                    .headlineMedium
                    ?.copyWith(
                  color: Styles.blueColor,
                ),),
            ],
          ),
          6.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppImage(
                path: image,
                type: ImageType.cachedNetwork,
                width: 37.rx,
                height: 37.rx,
                borderRadius: BorderRadius.circular(50),
              ),
              5.hSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 110.wx,
                        child: AppTextWidget(
                            text,
                            style: context.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 110.wx,
                    child: Row(
                      children: [
                        Assets.locationIconWidget,
                        3.hSpace,
                        Flexible(
                          child: AppTextWidget(
                            subText,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: context.theme.textTheme.headlineSmall?.copyWith(
                              // height: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}
class _LabelWithWidget extends StatelessWidget{
  final String icon;
  final String label;
  final String text;

  const _LabelWithWidget({
    super.key,
    required this.label,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.hx,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppTextWidget(
                label,
                style: context
                    .textTheme
                    .headlineMedium
                    ?.copyWith(
                  color: Styles.blueColor,
                ),),
            ],
          ),
          6.vSpace,
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start  ,
              children: [
                SizedBox.square(
                  dimension: 14.rx,
                  child: Center(
                    child: AppImage(
                      path: icon,
                      type: ImageType.asset,
                      // color: AppStateModel.of(context).isLightTheme ? Styles.brightGrayColor : null,
                    ),
                  ),
                ),
                5.hSpace,
                Flexible(
                  child: AppTextWidget(
                    text,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    style: context.textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}