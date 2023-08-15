


import 'package:flutter/material.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/params/request_payment_params.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/injection_container.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewController extends Controller{

  late WebViewController webViewController;
  final OrderWizardController baseController;

  PaymentWebViewController(this.baseController);

  bool listenWhen(OrdersState previous, OrdersState current) {
    return current is RequestPaymentState;
  }

  bool buildWhen(OrdersState previous, OrdersState current) {
    return current is RequestPaymentState;
  }

  void listener(BuildContext context, OrdersState state) {
    if(state is RequestPaymentLoaded){

      webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(state.data.paymentURL!));
    }
  }

  @override
  void init() {
    super.init();
    requestPayment();

  }

  requestPayment() {
    OrdersBloc.instance.add(
      RequestPaymentEvent(
        params: RequestPaymentParams(
          body: RequestPaymentBodyParams(
            paymentType: baseController.selectedPaymentMethod.value!,
            accountNumber: sl<AppStateModel>().initAppEntity.phoneNumber1!,
            entityId: baseController.orderEntity!.id!,
            priceToBePaid: baseController.orderBody.price ?? 0,
          ),
        ),
      ),
    );
  }
}