

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

mixin PaymentMixin implements Controller{

  late final OrderWizardController baseController;

  final selectedPaymentMethod = ValueNotifier<PaymentMethod?>(null);

  changeSelectedPaymentMethod(PaymentMethod p) {
    selectedPaymentMethod.value = p;
  }

  void paymentMethodListener(BuildContext context, OrdersState state) {
    if (state is CreateOrderError) {
      AppToast(state.message ?? '').show();
    }
    else if (state is CreateOrderLoaded) {
      OrdersBloc.instance.add(const GetLatestOrdersEvent());
      OrdersBloc.instance.add(const GetOrdersEvent());
      NavigationService.of(context).popUntilRout(CompaniesScreenRoute.name,);
      AutoTabsRouter.of(context).navigate(const MyOrdersScreenRoute());
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
        baseController.updateOrder(
          orderCreationTimestamp: DateTime.now().millisecondsSinceEpoch.toString(),
          executionDate: DateFormat('yyyy-MM-dd', langEN).format(baseController.selectedDate!,),
          paymentMethod: selectedPaymentMethod.value?.type,
        );
        // AppLogger.log(baseController.orderBody);
        OrdersBloc.instance.add(
          CreateOrderEvent(
            params: CreateOrderParams(body: baseController.orderBody,),
          ),
        );
        break;
      default:
        break;
    }
  }
}