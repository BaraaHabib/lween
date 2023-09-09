

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/widgets/error_widget.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/features/orders/screens/order_wizard/widgets/payment_webview_controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaymentWebViewScreen extends StatefulHookWidget {
  const PaymentWebViewScreen({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final OrderWizardController baseController = Controller.getInstance();
    final PaymentWebViewController controller = Controller.getInstance(
        instance: PaymentWebViewController(baseController),);
    return BlocConsumer<OrdersBloc, OrdersState>(
        bloc: OrdersBloc.instance,
        listener: controller.listener,
        buildWhen: controller.buildWhen,
        listenWhen: controller.listenWhen,
        builder: (context, state,) {
          return Scaffold(
            body: SafeArea(
              child: Builder(
                builder: (context) {
                  if(state is RequestPaymentLoaded){
                    return WebViewWidget(
                      controller: controller.webViewController,
                    );
                  }
                  else if(state is RequestPaymentError){
                    return AppErrorWidget(
                      message: state.message,
                      actionTitle: S.of(context).error,
                      onAction: controller.requestPayment,
                    );
                  }
                  return const WaitingWidget();
                }
              ),
            ),
          );
        }
    );
  }

}
