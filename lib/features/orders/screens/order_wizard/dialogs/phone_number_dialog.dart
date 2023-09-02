

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/configurations/styles/themes.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/features/orders/screens/order_wizard/phone_payment_controller.dart';
import 'package:lween/generated/l10n.dart';

class OrderPhoneNumberDialog extends HookWidget{
  const OrderPhoneNumberDialog(this.order, {super.key});

  final CreateOrderLoaded order;
  
  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance();
    final PhonePaymentController phoneController =
    Controller.getInstance(instance: PhonePaymentController(
        controller,
      ),
    );
    return GeneralDialog(
      title: S
          .of(context)
          .enterPhoneNumber,
      content: BlocConsumer<OrdersBloc, OrdersState>(
          bloc: OrdersBloc.instance,
          listener: phoneController.phoneDialogListener,
          buildWhen: phoneController.phoneDialogBuildListenWhen,
          listenWhen: phoneController.phoneDialogBuildListenWhen,
          builder: (ctx, cs) {
            return ValueListenableBuilder(
              valueListenable: phoneController.isCodeSent,
                builder: (context, isCodeSent, child,) => WillPopScope(
                onWillPop: () async {
                  return await Future.value(
                      false,
                  );
                },
                child: AbsorbPointer(
                  absorbing:
                  cs is CompletePaymentLoading ||
                  cs is RequestPaymentLoading ||
                      cs is ResendPaymentCodeLoading,
                  child: FormBuilder(
                    key: phoneController.phoneFormKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          11.vSpace,
                          AppTextWidget(
                            S.of(context).youMustHaveCashAccount,
                            style: context.textTheme.headlineMedium,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          15.vSpace,
                          AnimatedCrossFade(
                            firstChild: AppTextField(
                              name: 'phone',
                              controller: phoneController.phoneNumberController,
                              prefixIcon: SvgPicture.asset(Assets.phoneIcon,),
                              label: S.current.phoneNumber,
                              enabled: !isCodeSent && cs is! RequestPaymentLoading,
                              maxLength: 10,
                              formatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                    (v) => v is String && v.startsWith('09') ? null : S.of(context).phoneShouldStartWith09,
                                FormBuilderValidators.equalLength(10),
                              ]),
                              keyboardType: TextInputType.number,
                              hint: '09********',
                            ),
                            duration: 300.milliseconds,
                            secondChild: const SizedBox.shrink(),
                            crossFadeState: isCodeSent ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                          ),
                          if (isCodeSent)
                            ...[
                              Row(
                                children: [
                                  AppTextButton(
                                    onPressed: phoneController.backToEnterPhoneNumber,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox.square(
                                          dimension: 9.rx,
                                          child: Assets.arrowBackWidget(
                                            context,
                                            color: Styles.textButtonColor,
                                            reverse: true,),
                                        ),
                                        AppTextWidget(
                                          S.current.changePhoneNumber,
                                          strutStyle: const StrutStyle(
                                            height: 1.4,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                              color: Styles.blueColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // const Spacer(),
                            // 15.vSpace,
                            ],
                          AnimatedCrossFade(
                            firstChild:  AppTextField(
                              name: 'code',
                              controller: phoneController.codeController,
                              prefixIcon: SvgPicture.asset(Assets.checkCodeSVG,),
                              textAlign: TextAlign.start,
                              focusNode: phoneController.codeFocusNode,
                              label: S
                                  .of(context)
                                  .verificationCode,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                // FormBuilderValidators.equalLength(4),
                              ]),
                              keyboardType: TextInputType.number,
                            ),
                            secondChild: const SizedBox.shrink(),
                            crossFadeState: isCodeSent ? CrossFadeState
                                .showFirst : CrossFadeState.showSecond,
                            duration: 300.milliseconds,
                          ),
                          20.vSpace,
                          SizedBox(
                            height: 45.hx,
                            child: Builder(
                              builder: (ctx,) {

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child:  AppGradientTextButton(
                                        isLoading: cs is CompletePaymentLoading ||
                                            cs is RequestPaymentLoading ,
                                        gradientType: AppTextButtonGradientType.primary,
                                        onTap: () => phoneController.sendCode(context),
                                        content: S
                                            .of(context)
                                            .send,
                                      ),
                                    ),
                                    if(isCodeSent)
                                      ...[
                                        const Spacer(flex: 1,),
                                        Expanded(
                                          flex:8,
                                          child: AnimatedCrossFade(
                                            firstChild:const SizedBox.shrink(),
                                            secondChild: AppGradientTextButton(
                                              color: Styles.brightGrayColor,
                                              withGradiant : false,
                                              isLoading:cs is ResendPaymentCodeLoading,
                                              onTap: () => phoneController.resendPaymentCode(context),
                                              content: S
                                                  .of(context)
                                                  .resendCode,
                                            ),
                                            crossFadeState: isCodeSent ? CrossFadeState
                                                .showSecond : CrossFadeState.showFirst,
                                            duration: 300.milliseconds,
                                          ),
                                        ),
                                      ],

                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
