

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/request_payment.dart';
import 'package:lween/features/orders/params/complete_payment_params.dart';
import 'package:lween/features/orders/params/request_payment_params.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/generated/l10n.dart';

class PhonePaymentController extends Controller{

  PhonePaymentController(this.baseController);

  OrderWizardController? baseController;

  RequestPaymentEntity? requestPaymentEntity;


  //#region phone
  final phoneFormKey = GlobalKey<FormBuilderState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  ValueNotifier isCodeSent = ValueNotifier(false);

  void phoneDialogListener(BuildContext context, OrdersState state) {
    if (state is RequestPaymentError ||
        state is ResendPaymentCodeError ||
        state is CompletePaymentError
    ) {
      AppToast(state.message ?? '').show();
    }
    else if (state is RequestPaymentLoaded) {
      requestPaymentEntity = state.data;
      isCodeSent.value = true;
    }
    else if (state is ResendPaymentCodeLoaded) {
      AppToast(S.current.codeWasResentToYourNumber,).show();
    }
    else if (state is CompletePaymentLoaded) {
      isCodeSent.value = false;
      AppToast(S.of(context).orderFinishedSuccessfully,).show();
      baseController?.goToOrderDetailsScreen(baseController!.orderEntity!, context);
    }
  }

  bool phoneDialogBuildListenWhen(OrdersState previous, OrdersState current) {
    return current is RequestPaymentState || current is ResendPaymentCodeState
        || current is CompletePaymentState;
  }

  sendCode(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!isCodeSent.value) {
      if ((phoneFormKey.currentState?.fields['phone']?.validate() ?? false)) {
        OrdersBloc.instance.add(
          RequestPaymentEvent(
            params: RequestPaymentParams(
              body: RequestPaymentBodyParams(
                paymentType: baseController!.selectedPaymentMethod.value!,
                accountNumber: phoneFormKey.currentState?.getRawValue('phone'),
                entityId: baseController!.orderEntity!.id!,
                priceToBePaid: baseController?.orderBody.price ?? 0,
              ),
            ),),);
      }
    } else if (
    (phoneFormKey.currentState?.fields['phone']?.validate() ?? false) &&
        (phoneFormKey.currentState?.fields['code']?.validate() ?? false)
    ) {
      OrdersBloc.instance.add(
        CompletePaymentEvent(
          params: CompletePaymentParams(
            body: CompletePaymentBodyParams(
              paymentType: baseController!.selectedPaymentMethod.value!,
              accountNumber: phoneFormKey.currentState?.getRawValue('phone'),
              transactionId: requestPaymentEntity!.transactionId!,
              confirmationCode: phoneFormKey.currentState?.getRawValue('code'),
            ),
          ),),
      );
    }
  }

  resendPaymentCode(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if(
    (phoneFormKey.currentState?.fields['phone']?.validate() ?? false)
    ) {
      OrdersBloc.instance.add(
        ResendPaymentCodeEvent(
          accountNumber: phoneFormKey.currentState?.getRawValue('phone'),
          paymentType: baseController!.selectedPaymentMethod.value!,
          transactionId: requestPaymentEntity!.transactionId!,
        ),
      );
    }
  }

  backToEnterPhoneNumber() {
    codeController.text = '';
    isCodeSent.value = false;
  }

//#endregion phone


}