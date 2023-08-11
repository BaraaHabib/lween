

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/params/create_order_params.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/generated/l10n.dart';

mixin PaymentMixin implements Controller{

  OrderWizardController? baseController;
  String? orderCreationTimestamp;
  final selectedPaymentMethod = ValueNotifier<PaymentMethod?>(null);

  num discount = 0;

  changeSelectedPaymentMethod(PaymentMethod p) {
    selectedPaymentMethod.value = p;
  }

  void paymentMethodListener(BuildContext context, OrdersState state) {
    if (state is CreateOrderError) {
      AppToast(state.message ?? '').show();
    }
    else if (state is CreateOrderLoaded) {
      OrdersBloc.instance.refreshOrders();
      NavigationService.of(context).popUntilRoot();
      // AutoTabsRouter.of(context).navigate(const MyOrdersScreenRoute());
      NavigationService.of(context).navigateTo(OrderDetailsScreenRoute(order: state.order),);
    }
  }

  pay(BuildContext context) {
    if(selectedPaymentMethod.value == null){
      return;
    }
    switch (selectedPaymentMethod.value!) {
      case PaymentMethod.syriatel:
      case PaymentMethod.mtn:
        break;
      case PaymentMethod.cash:
        baseController!.updateOrder(
          orderCreationTimestamp: orderCreationTimestamp,
          executionDate: DateFormat('yyyy-MM-dd', langEN).format(baseController!.selectedDate!,),
          paymentMethod: selectedPaymentMethod.value?.type,
          travelId: baseController?.selectedTravelEntity?.id ?? '',
        );
        // AppLogger.log(baseController!.orderBody);
        OrdersBloc.instance.add(
          CreateOrderEvent(
            params: CreateOrderParams(body: baseController!.orderBody,),
          ),
        );
        break;
      default:
        break;
    }
  }

  final TextEditingController voucherController = TextEditingController();

  void voucherListener(BuildContext context, OrdersState state) {
    discount = 0;
    if (state is CheckVoucherError) {
      AppToast(state.message ?? '').show();
    }
    else if (state is CheckVoucherLoaded) {
      num newValue = baseController?.totalPrice ?? 0;
      final v = state.voucher;
      if (v.percentage != 0 && v.percentage != null) {
        discount = (v.percentage! / 100) * newValue;
        newValue = newValue - discount;
      } else if (v.value != null && v.value != 0) {
        discount = v.value!;
        newValue = newValue - v.value!;
      } else {
        newValue = baseController?.totalPrice ?? 0;
      }
      baseController?.updateOrder(
        voucher: voucherController.text.trim(),
        price: newValue,
      );
    }
    else if (state is CheckVoucherError) {
      baseController?.updateOrder(
        voucher: null,
      );
    }
  }

  bool voucherListenWhen(OrdersState previous, OrdersState current) {
    return current is CheckVoucherState;
  }

  bool voucherBuildWhen(OrdersState previous, OrdersState current) {
    return current is CheckVoucherState;
  }

  void checkVoucher() {
    if(voucherController.text.isEmpty){
      baseController?.updateOrder(
        price: baseController?.totalPrice,
      );
      return;
    }
    OrdersBloc.instance.add(
      CheckVoucherEvent(
          code: voucherController.text.trim(),
          paymentProvider: selectedPaymentMethod.value?.paymentProviderEnum
      ),
    );
  }


}