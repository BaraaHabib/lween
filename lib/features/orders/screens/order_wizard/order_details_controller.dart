


import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/core/exceptions/app_exceptions.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/generated/l10n.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class OrderDetailsController extends Controller {

  ScreenshotController screenshotController = ScreenshotController();

  OrderEntity order;

  cancelOrder(BuildContext context) {
    AppDialogs.showYesNoDialog(
        context: context,
        content: S
            .of(context)
            .areYouSureYouWantToCancelOrder,
        yesCallBack: () {
          OrdersBloc.instance.add(CancelOrderEvent(orderId: order.id ?? ''));
        }
    );
  }

  OrderDetailsController(this.order);

  bool orderDetailsScreenBuildWhen(OrdersState previous, OrdersState current) {
    return current is CancelOrderState;
  }

  bool orderDetailsScreenListenWhen(OrdersState previous, OrdersState current) {
    return current is CancelOrderState;
  }

  void orderDetailsScreenListener(BuildContext context, OrdersState state) {
    if(state is CancelOrderError){
      AppToast(state.message ?? '').show();
    }else if(state is CancelOrderLoaded){
      AppToast(S.of(context).orderHasBeenCanceled).show();
      order.status = OrderPaymentStatus.canceled.apiValue;
      order.canBeCanceled = false;
      OrdersBloc.instance.refreshOrders();

    }

  }

  Future<bool> saveOrder(BuildContext context) async {
    try {
      await Permission.storage.request();
      Uint8List? image = await screenshotController.capture();
      if(image == null){
        throw const AppException('Could not save order');
      }
      await ImageGallerySaver.saveImage(image);
      AppToast(S.current.orderSavedToGallery).show();
      return true;
    }
    on Exception catch (e) {
      AppToast(e.toString()).show();
      return false;
    }
  }
}