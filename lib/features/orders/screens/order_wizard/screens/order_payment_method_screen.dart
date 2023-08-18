


import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_person_info_screen.dart';
import 'package:lween/features/orders/screens/order_wizard/widgets/order_payment_method/payment_method_widget.dart';
import 'package:lween/generated/l10n.dart';

@RoutePage()
class OrderPaymentMethodScreen extends HookWidget {
  const OrderPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance();
    useEffect(() {
      controller.checkVoucher();
      controller.orderCreationTimestamp = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      return () {};
    }, const [],);
    return BlocConsumer<OrdersBloc, OrdersState>(
        bloc: OrdersBloc.instance,
        listener: controller.paymentMethodListener,
        builder: (context, state) {
          return SizedBox(
            child: IgnorePointer(
              ignoring: state is CreateOrderLoading || state is RequestPaymentLoading,
              child: AppScaffold(
                title: S
                    .of(context)
                    .choosePaymentMethod,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ListView(
                      children: [
                        20.vSpace,
                        Container(
                          // height: 50.hx,
                          padding: EdgeInsets.all(10.rx),
                          decoration: BoxDecoration(
                            color: Styles.warningColor,
                            borderRadius: Styles.borderRadius14px,
                            border: Border.all(
                              color: const Color(0xFFD2C27B).withOpacity(0.2),),
                          ),
                          child: Row(
                            children: [
                              SizedBox.square(
                                dimension: 23.rx,
                                child: AppImage(
                                  path: Assets.warningPNG,
                                  type: ImageType.asset,
                                ),
                              ),
                              6.hSpace,
                              Expanded(
                                child: AppTextWidget(
                                  S
                                      .of(context)
                                      .orderDeletionWarning,
                                  maxLines: 2,
                                  style: context.textTheme.headlineMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        5.vSpace,
                        SizedBox(
                          height: 330.hx,
                          child: ValueListenableBuilder(
                              valueListenable: controller.selectedPaymentMethod,
                              builder: (context, value, child) {
                                return ListView(
                                  children: [
                                    PaymentMethodWidget(
                                      icon: Assets.cashPNG,
                                      title: S
                                          .of(context)
                                          .payAtCenter,
                                      paymentMethod: PaymentMethod.cash,
                                      onTap: controller
                                          .changeSelectedPaymentMethod,
                                      disabled: controller
                                          .userExceededAllowedSeatsWithoutPayment,
                                    ),
                                    PaymentMethodWidget(
                                      icon: Assets.cashMobilePNG,
                                      title: S.of(context).cashMobile,
                                      paymentMethod: PaymentMethod.cashMobile,
                                      onTap: controller
                                          .changeSelectedPaymentMethod,
                                    ),
                                    PaymentMethodWidget(
                                      icon: Assets.bemoPNG,
                                      title: S
                                          .of(context)
                                          .bemoBank,
                                      paymentMethod: PaymentMethod.bemo,
                                      onTap: controller
                                          .changeSelectedPaymentMethod,
                                    ),
                                    PaymentMethodWidget(
                                      icon: Assets.fatoraLogoPNG(context),
                                      title: S
                                          .of(context)
                                          .fatora,
                                      paymentMethod: PaymentMethod.fatora,
                                      onTap: controller
                                          .changeSelectedPaymentMethod,
                                    ),
                                    PaymentMethodWidget(
                                      icon: Assets.eCashPNG(context),
                                      title: S
                                          .of(context)
                                          .eCash,
                                      paymentMethod: PaymentMethod.eCash,
                                      onTap: controller
                                          .changeSelectedPaymentMethod,
                                    ),

                                  ],
                                );
                              }
                          ),
                        ),
                        const VoucherWidget(),
                        // 45.vSpace,
                      ],
                    ),
                    if(controller.orderEntity == null)
                      Positioned(
                      bottom: 30.hx,
                      child: BlocBuilder<OrdersBloc, OrdersState>(
                          bloc: OrdersBloc.instance,
                          buildWhen: controller.voucherBuildWhen,
                          builder: (context, voucherState) {
                            return IgnorePointer(
                              ignoring: voucherState is CheckVoucherLoading,
                              child: Hero(
                                tag: 'order-next',
                                child: AppGradientTextButton(
                                  content: S.current.next,
                                  isLoading: state is CreateOrderLoading,
                                  gradientType: AppTextButtonGradientType.secondary,
                                  onTap: () => controller.pay(context),
                                ),
                              ),
                            );
                          }
                      ))
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}