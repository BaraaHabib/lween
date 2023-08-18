

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/models/request_payment.dart';
import 'package:lween/features/orders/params/complete_payment_params.dart';
import 'package:lween/features/orders/params/create_order_params.dart';
import 'package:lween/features/orders/params/request_payment_params.dart';
import 'package:lween/features/orders/screens/order_wizard/dialogs/phone_number_dialog.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/main.dart';

mixin PaymentMixin implements Controller{

  OrderWizardController? baseController;
  String? orderCreationTimestamp;
  final selectedPaymentMethod = ValueNotifier<PaymentMethod?>(null);

  num discount = 0;

  OrderEntity? orderEntity;

  changeSelectedPaymentMethod(PaymentMethod p) {
    selectedPaymentMethod.value = p;
  }

  void paymentMethodListener(BuildContext context, OrdersState state) {
    if (state is CreateOrderError) {
      AppToast(state.message ?? '').show();
    }
    else if (state is CreateOrderLoaded) {
      orderEntity = state.order;
      continueToPayment(state,context,);
    }
  }

  pay(BuildContext context) async {
    if (selectedPaymentMethod.value == null) {
      return;
    }
    bool? isConfirmed = await AppDialogs.showYesNoDialog(
        context: context,
        title: S.of(context).confirmOperation,
        content: S.of(context).city1City2DateXPrice(
          baseController?.selectedFromCity?.name ?? '',
          baseController?.selectedToCity?.name ?? '',
          baseController?.selectedCompany?.name ?? '',
          baseController?.selectedDateFormatted ?? '',
          baseController?.orderBody.seats?.length.toString() ?? '',
          baseController?.orderBody.price.toString() ?? '',
        ));
    if(!(isConfirmed ?? false)){
      return;
    }
    baseController!.updateOrder(
      orderCreationTimestamp: orderCreationTimestamp,
      executionDate: DateFormat('yyyy-MM-dd', langEN).format(
        baseController!.selectedDate!,),
      paymentMethod: selectedPaymentMethod.value?.type,
      travelId: baseController?.selectedTravelEntity?.id ?? '',
    );
    // AppLogger.log(baseController?.orderBody);
    OrdersBloc.instance.add(
      CreateOrderEvent(
        params: CreateOrderParams(body: baseController!.orderBody,),
      ),
    );
  }

  //#region voucher
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
    if (voucherController.text.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        baseController?.updateOrder(
          price: baseController?.totalPrice,
        );
      }
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
  //#endregion voucher

  void continueToPayment(CreateOrderLoaded state,BuildContext context,) {
    if (selectedPaymentMethod.value!.isByPhoneNumber) {
      showDialog(
        context: context,
        useRootNavigator: false,
        builder: (ctx) =>
            OrderPhoneNumberDialog(
              state,
            ),
      );
    }
    else if (selectedPaymentMethod.value!.isWebView) {
      AutoRouter
          .of(context)
          .push(PaymentWebViewScreenRoute(order: orderEntity!,))
          .then((value) {
        goToOrderDetailsScreen(orderEntity!, context,);
      });
    }
    else if (state.order.isPayedInCenter) {
      goToOrderDetailsScreen(state.order, context,);
    }
  }



  goToOrderDetailsScreen(OrderEntity order, BuildContext context) {
    OrdersBloc.instance.refreshOrders();
    final currentRouter = NavigationService
        .of(context,)
        .closestRouter;
    final tabsRouter = currentRouter.childControllers.firstWhereOrNull((e) => e is TabsRouter);
    tabsRouter?.navigate(const MyOrdersScreenRoute());
    currentRouter.popUntilRoot();
    // NavigationService
    //     .of(context,)
    //     .closestRouter
    //     .parent<TabsRouter>()
    //     ?.navigate(const MyOrdersScreenRoute());
    OrdersBloc.instance.add(
        GetOrdersEvent(navigateToDetails: true, ids: [order.id!,]));
  }
}