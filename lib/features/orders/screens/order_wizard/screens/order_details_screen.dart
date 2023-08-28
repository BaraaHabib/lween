

import 'dart:ui' as ui;
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/src/extensions/context_extensions.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/dashed_divider.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/screens/order_wizard/order_details_controller.dart';
import 'package:lween/generated/l10n.dart';
import 'dart:math' as math;

import 'package:screenshot/screenshot.dart';

@RoutePage()
class OrderDetailsScreen extends HookWidget {

  const OrderDetailsScreen({
    required this.order,
    super.key,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final controller = Controller.getInstance(instance: OrderDetailsController(order,),);
    return BlocConsumer<OrdersBloc,OrdersState>(
      bloc: OrdersBloc.instance,
        buildWhen: controller.orderDetailsScreenBuildWhen,
        listenWhen: controller.orderDetailsScreenListenWhen,
        listener:  controller.orderDetailsScreenListener,
        builder: (context,state) {
        return IgnorePointer(
          ignoring: state is CancelOrderLoading,
          child: AppScaffold(
            title: S
                .of(context)
                .orderDetails,
            child: SizedBox(
              width: 0.9.sw,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    30.vSpace,
                    Screenshot(
                      controller: controller.screenshotController,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Styles.circularBorderRadius12px,),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // height: 0.5.sh,
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.wx,
                                vertical: 30.hx,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Styles.circularBorderRadius14px,),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        AppTextWidget('#',
                                          style: context
                                              .textTheme
                                              .headlineLarge?.copyWith(
                                            color: Styles.blueColor,
                                            height: 0.5,
                                          ),
                                        ),
                                        AppTextWidget(
                                          order.orderNumber ?? ' ',
                                          style: context
                                              .textTheme
                                              .headlineLarge?.copyWith(
                                            color: Styles.tripsCountTextColor,
                                            height: 0.4,
                                          ),
                                        ),
                                        const Spacer(),
                                        Row(
                                          textDirection: ui.TextDirection.rtl,
                                          children: [
                                            Text(
                                              AppConfigurations.ApplicationName, style: context
                                                .textTheme
                                                .headlineLarge?.copyWith(
                                              color: Styles.tripsCountTextColor,
                                              height: 0.3,
                                              fontSize: 19.spx,
                                            ),
                                            ),
                                            2.hSpace,
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 7.hx,),
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: AppImage(
                                                  path: Assets.logoPNG,
                                                  type: ImageType.asset,
                                                  width: 21.rx,
                                                  height: 21.rx,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    30.vSpace,
                                    _LabelWithText(S.current.companyName,
                                        order.transportationCompany?.text ?? ''),
                                    20.vSpace,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: _LabelWithText(S.current.from, order.fromCity?.text ??
                                              ''),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: _LabelWithText(S.current.to, order.toCity?.text ??
                                              ''),
                                        ),
                                        // 1.hSpace,
                                      ],
                                    ),
                                    20.vSpace,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: _LabelWithText(S.current.travelDate, order
                                              .formattedTravelTimeDate ?? ''),
                                        ),
                                        // Spacer(),
                                        Expanded(
                                          flex: 1,
                                          child: _LabelWithText(S
                                              .of(context)
                                              .travelDateTime, DateFormat.jm(langEN).format(
                                              order.travelTimeDate) ?? ''),
                                        ),
                                        1.hSpace,
                                      ],
                                    ),
                                    20.vSpace,
                                    Row(
                                      children: [
                                        AppTextWidget(
                                          S
                                              .of(context)
                                              .passengersNames,
                                          style: context
                                              .textTheme
                                              .titleSmall?.copyWith(
                                                color: Styles.labelInsideCard,
                                          )
                                        ),
                                      ],
                                    ),
                                    2.vSpace,
                                    Column(
                                      children: order.seats?.map((e) =>
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                e.personName ?? '',
                                                style: context.textTheme.headlineMedium,
                                              ),
                                            ],
                                          ),
                                      ).toList() ?? [],
                                    ),
                                    20.vSpace,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        _LabelWithText(
                                            S.current.selectedSeats,
                                          order.seats?.map((e) => e.seatNumber ?? '').join(
                                              ',') ?? '',
                                        ),
                                        // _LabelWithText(S.of(context).vehicleNumber , order.formattedTravelTimeDate ??
                                        //     '',),
                                        // Spacer(),
                                        1.hSpace,
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomPaint(painter: DashedLinePainter()),
                            SizedBox(
                              // height: 100.hx,
                              child: Column(
                                children: [
                                  // if(order.isCanceled)
                                  //   Row(
                                  //     mainAxisAlignment:MainAxisAlignment.center,
                                  //     children: [
                                  //       AppTextWidget(
                                  //         S.of(context).orderIsCanceled,
                                  //         style: context.textTheme.headlineLarge?.copyWith(
                                  //           color: order.paymentStatusTextColor(context),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   )
                                  //   else
                                      ...[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          children: [
                                            AppTextWidget(
                                              S.of(context).bookingStatus,
                                              style: context.textTheme.titleMedium?.copyWith(
                                                color: Styles.labelInsideCard,
                                              ),
                                            ),
                                          ],
                                        ),
                                        12.vSpace,
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          children: [
                                            // const Spacer(
                                            //   flex: 1,
                                            // ),
                                            15.hSpace,
                                            Flexible(
                                              child: AppTextWidget(
                                                order.finalStateText ?? '',
                                                textAlign: TextAlign.center,
                                                maxLines: 3,
                                                style: context.textTheme.headlineMedium?.copyWith(
                                                  color: order.paymentStatusTextColor(context),
                                                ),
                                              ),
                                            ),
                                            15.hSpace,
                                            // const Spacer(
                                            //   flex: 1,
                                            // ),
                                          ],
                                        ),
                                        12.vSpace,
                                        // Row(
                                        //   mainAxisAlignment:MainAxisAlignment.center,
                                        //   children: [
                                        //     15.hSpace,
                                        //     Flexible(
                                        //       child: AppTextWidget(
                                        //         order.paymentAmountText ?? '',
                                        //         textAlign: TextAlign.center,
                                        //         maxLines: 2,
                                        //         style: context.textTheme.headlineMedium?.copyWith(
                                        //           color: order.paymentAmountTextColor(context),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //     15.hSpace,
                                        //   ],
                                        // ),
                                      ],

                                ],
                              ),
                            ),
                            15.vSpace,
                          ],
                        ),
                      ),
                    ),
                    if(controller.orderCanBeSaved)
                      ...[
                        20.vSpace,
                        AppGradientTextButton(
                          onTap: () {
                            controller.saveOrder(context,);
                          },
                          color: Styles.ghostWhiteColor,
                          fontColor: Styles.lightFontColor,
                          withGradiant: false,
                          content: S
                              .of(context)
                              .saveToDevice,
                        ),
                      ],
                    if(controller.order.canBeCanceled ?? false)
                      ...[
                        10.vSpace,
                        AppGradientTextButton(
                          onTap: () => controller.cancelOrder(context,),
                          isLoading: state is CancelOrderLoading,
                          color: Styles.colorOrange,
                          fontColor: Styles.darkFontColor,
                          withGradiant: false,
                          content: S
                              .of(context)
                              .cancelOrder,
                        ),
                      ],
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

class MyPainter extends CustomPainter {
  final double startFrom;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      startFrom,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  MyPainter(this.startFrom,);
}

class _LabelWithText extends StatelessWidget {

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppTextWidget(
          label,
          style: context
              .textTheme
              .titleSmall?.copyWith(
              color: Styles.labelInsideCard,
          ),
        ),
        3.hSpace,
        AppTextWidget(
          text,
          style: context
              .textTheme
              .headlineMedium,
          maxLines: 3,
        ),
      ],
    );
  }

  const _LabelWithText(this.label, this.text);
}