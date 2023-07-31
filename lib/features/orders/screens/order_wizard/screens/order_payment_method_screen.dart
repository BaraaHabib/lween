


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
    final OrderWizardController controller = Controller.get();
    return BlocConsumer<OrdersBloc, OrdersState>(
        bloc: OrdersBloc.instance,
        listener: controller.paymentMethodListener,
        builder: (context, state) {
          return IgnorePointer(
            ignoring: state is CreateOrderLoading,
            child: AppScaffold(
              title: S
                  .of(context)
                  .choosePaymentMethod,
              child: ListView(

                children: [
                  20.vSpace,
                  Container(
                    height: 50.hx,
                    padding: EdgeInsets.all(10.rx),
                    decoration: BoxDecoration(
                      color: Styles.warningColor,
                      border: Border.all(color: const Color(0xFFD2C27B).withOpacity(0.2),),
                    ),
                    child: Row(
                      children: [
                        AppImage(
                          path: Assets.warningPNG, type: ImageType.asset,
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
                  SizedBox(
                    height: 390.hx,
                    child: ValueListenableBuilder(
                        valueListenable: controller.selectedPaymentMethod,
                        builder: (context, value, child) {
                          return ListView(
                            children: [
                              PaymentMethodWidget(
                                icon: Assets.syriatelPNG,
                                title: S
                                    .of(context)
                                    .syriatelCash,
                                paymentMethod: PaymentMethod.syriatel,
                                onTap: controller.changeSelectedPaymentMethod,
                              ),
                              PaymentMethodWidget(
                                icon: Assets.mtnPNG,
                                title: S
                                    .of(context)
                                    .cashMtn,
                                paymentMethod: PaymentMethod.mtn,
                                onTap: controller.changeSelectedPaymentMethod,
                              ),
                              PaymentMethodWidget(
                                icon: Assets.bemoPNG,
                                title: S
                                    .of(context)
                                    .bemoBank,
                                paymentMethod: PaymentMethod.bemo,
                                onTap: controller.changeSelectedPaymentMethod,
                              ),
                              PaymentMethodWidget(
                                icon: Assets.fatoraLogoPNG(context),
                                title: S
                                    .of(context)
                                    .fatora,
                                paymentMethod: PaymentMethod.fatora,
                                onTap: controller.changeSelectedPaymentMethod,
                              ),
                              PaymentMethodWidget(
                                icon: Assets.eCashPNG(context),
                                title: S.of(context).eCash,
                                paymentMethod: PaymentMethod.eCash,
                                onTap: controller.changeSelectedPaymentMethod,
                              ),
                              PaymentMethodWidget(
                                icon: Assets.cashPNG,
                                title: S
                                    .of(context)
                                    .payAtCenter,
                                paymentMethod: PaymentMethod.cash,
                                onTap: controller.changeSelectedPaymentMethod,
                              ),
                            ],
                          );
                        }
                    ),
                  ),
                  const VoucherWidget(),
                  12.vSpace,
                  if(state is CreateOrderLoading)
                    const WaitingWidget()
                  else
                    AppGradientTextButton(
                      content: S.current.next,
                      gradientType: AppTextButtonGradientType.secondary,
                      onTap: () => controller.pay(context),
                    )
                ],
              ),
            ),
          );
        }
    );
  }
}