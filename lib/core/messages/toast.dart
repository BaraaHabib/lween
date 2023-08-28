import 'package:fluttertoast/fluttertoast.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/main.dart';

import 'app_system_message.dart';

class AppToast extends AppSystemMessage {
  AppToast(String message)
      : super(type: AppSystemMessageTyp.toast, message: message);

  @override
  Future show() {
    return Fluttertoast.showToast(
    msg: message,
      textColor  : Lween.navigatorKey.currentContext!.textTheme.titleMedium?.color,
      fontSize  : Lween.navigatorKey.currentContext!.textTheme.titleMedium?.fontSize,
      backgroundColor: Lween.navigatorKey.currentContext!.theme.primaryColor,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_LONG,
  );
  }
}
