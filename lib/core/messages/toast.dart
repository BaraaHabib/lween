import 'package:fluttertoast/fluttertoast.dart';
import 'package:lween/core/configurations/styles/styles.dart';

import 'app_system_message.dart';

class AppToast extends AppSystemMessage {
  AppToast(String message)
      : super(type: AppSystemMessageTyp.toast, message: message);

  @override
  Future show() => Fluttertoast.showToast(msg: message,backgroundColor: Styles.colorPrimary,);
}
