import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/main.dart';

import 'app_system_message.dart';

const toastDuration = Duration(seconds: 3);

class AppToast extends AppSystemMessage {
  AppToast(String message)
      : super(type: AppSystemMessageTyp.toast, message: message);

  @override
  show() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Lween.fToast.context?.theme.primaryColor,
      ),
      constraints: BoxConstraints(
        maxHeight: 80.hx,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: AppImage(
              path: Assets.logoPNG,
              type: ImageType.asset,
              width: 30.rx,
              height: 30.rx,
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Flexible(
            child: Text(
              message,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );

    Lween.fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: toastDuration,
    );
    return Future.value();
    //   return Fluttertoast.showToast(
  //   msg: message,
  //     textColor  : Lween.navigatorKey.currentContext!.textTheme.titleMedium?.color,
  //     fontSize  : Lween.navigatorKey.currentContext!.textTheme.titleMedium?.fontSize,
  //     backgroundColor: Lween.navigatorKey.currentContext!.theme.primaryColor,
  //     gravity: ToastGravity.TOP,
  //     toastLength: Toast.LENGTH_LONG,
  // );
  }
}
