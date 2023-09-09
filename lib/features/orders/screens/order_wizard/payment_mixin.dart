

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
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/models/request_payment.dart';
import 'package:lween/features/orders/params/complete_payment_params.dart';
import 'package:lween/features/orders/params/create_order_params.dart';
import 'package:lween/features/orders/params/my_orders_params.dart';
import 'package:lween/features/orders/params/request_payment_params.dart';
import 'package:lween/features/orders/repo/orders_repository.dart';
import 'package:lween/features/orders/screens/order_wizard/dialogs/phone_number_dialog.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';
import 'package:lween/main.dart';

mixin PaymentMixin implements Controller{

  OrderWizardController? baseController;
  String? orderCreationTimestamp;
  final selectedPaymentMethod = ValueNotifier<PaymentMethod?>(null);

  num discount = 0;

  OrderEntity? orderEntity;

  changeSelectedPaymentMethod(PaymentMethod p) {
    if(selectedPaymentMethod.value != p){
      selectedPaymentMethod.value = p;

      /// clear coupon
      baseController?.discount = 0;
      baseController?.couponController.clear();
      baseController?.updateOrder(
        coupon: null,
        price: baseController?.totalPrice,
      );
    }
  }

  void paymentMethodListener(BuildContext context, OrdersState state) {
    if (state is CreateOrderError) {
      AppToast(state.message ?? '').show();
      if(state.code == CreateOrderExceptionCode.priceChanged){
        if(state.data is Map && state.data?['seatPrice'] is num){
          baseController?.selectedTravelEntity?.price = state.data?['seatPrice'];
          baseController?.updateOrder(
            price: baseController?.totalPrice,
          );
          NavigationService.of(context).popUntilRout(OrderSeatsScreenRoute.name);
        }
      }
      if(state.code == CreateOrderExceptionCode.seatWasReserved){
        if(state.data is Map && state.data?['alreadyTakenSeats'] is List) {
          final reservedSeatsList = List.of(state.data?['alreadyTakenSeats']) ;
          List<(int, int, SeatEntity)> seatsToDisable = [];
          for (var number in reservedSeatsList) {
            for (var seat in baseController!.selectedTravelEntity!
                .seatsMatrix) {
              if(seat.$3.number == number) {
                seatsToDisable.add(seat);
              }
            }
          }
          for (var seatToRemove in seatsToDisable) {
            final seat =  baseController!.selectedTravelEntity!.seats?[seatToRemove.$1][seatToRemove.$2];
            seat!.isAvailable = false;
            baseController?.unSelectSeat(seat.number!);
          }
        }
        NavigationService.of(context).popUntilRout(OrderSeatsScreenRoute.name);
      }
    }
    else if (state is CreateOrderLoaded) {
      orderEntity = state.order;
      continueToPayment(state,context,);
    }
  }

  submitOrder(BuildContext context) async {
    // NavigationService.of(context).navigateTo(PaymentWebViewScreenRoute(order: OrderEntity()));
    // return;
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
          AppConfigurations.currency,
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
      price: baseController!.orderBody.price!,
    );
    // AppLogger.log(baseController?.orderBody);
    OrdersBloc.instance.add(
      CreateOrderEvent(
        params: CreateOrderParams(body: baseController!.orderBody,),
      ),
    );
  }

  //#region Coupon
  final TextEditingController couponController = TextEditingController();

  void couponListener(BuildContext context, OrdersState state) {
    discount = 0;
    if (state is CheckCouponError) {
      AppToast(state.message ?? '').show();
      baseController?.updateOrder(
        coupon: null,
        price: baseController?.totalPrice,
      );
    }
    else if (state is CheckCouponLoaded) {
      num newValue = baseController?.totalPrice ?? 0;
      final v = state.coupon;
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
        coupon: couponController.text.trim(),
        price: newValue,
      );
    }
    baseController!.checkPaymentMethodValidity();
  }

  bool couponListenWhen(OrdersState previous, OrdersState current) {
    return current is CheckCouponState;
  }

  bool couponBuildWhen(OrdersState previous, OrdersState current) {
    return current is CheckCouponState;
  }

  void checkCoupon() {
    if (couponController.text.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        baseController?.updateOrder(
          price: baseController?.totalPrice,
        );
      }
      );
      return;
    }
    OrdersBloc.instance.add(
      CheckCouponEvent(
          code: couponController.text.trim(),
          paymentProvider: selectedPaymentMethod.value?.paymentProviderEnum
      ),
    );
  }
  //#endregion Coupon

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
    else  {
      goToOrderDetailsScreen(state.order, context,);

      /// refresh profile
      if(selectedPaymentMethod.value!.isFromWallet){
        AccountBloc.instance.add(const GetProfileEvent());
      }
    }
  }



  goToOrderDetailsScreen(OrderEntity order, BuildContext context) async {
    OrdersBloc.instance.refreshOrders();
    final currentRouter = NavigationService
        .of(context,)
        .closestRouter;
    final tabsRouter = currentRouter.childControllers.firstWhereOrNull((
        e) => e is TabsRouter);
    await tabsRouter?.navigate(const MyOrdersStackRoute());
    currentRouter.popUntilRoot();
    OrdersBloc.instance.getAndNavigateToOrderDetails(
        currentRouter,
        order.id!
    );
  }
}