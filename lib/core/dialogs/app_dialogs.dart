import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/main.dart';

import '../../generated/l10n.dart';
import '../configurations/styles/styles.dart';
import '../navigation/navigation_service.dart';

part 'retry_dialog.dart';
part 'system_dialog.dart';
part 'yes_no_dialog.dart';
part 'general_dialog.dart';

abstract class AppDialogs {
  static Future showRetryDialog({
    required BuildContext context,
    required String content,
    String title = 'Error',
    Function? retryCallBack,
  }) async {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      // barrierColor: Colors.white.withAlpha(50),
      builder: (BuildContext context) => RetryDialog(
        message: content,
        retry: retryCallBack,
        title: title,
      ),
    );
  }

  static Future showYesNoDialog({
    required BuildContext context,
    required String content,
    String title = '',
    Function? yesCallBack,
    Function? noCallBack,
  }) async {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      // barrierColor: Colors.white.withAlpha(50),
      builder: (BuildContext context) => YesNoDialog(
        message: content,
        yesCallback: yesCallBack,
        noCallBack: noCallBack,
        title: title,
      ),
    );
  }

  static Future showGeneralDialog({
    required BuildContext context,
    required Widget content,
    required DialogType type,
    Color? color,
    Widget? icon,
    String title = '',
    TextStyle? titleStyle,
    List<DialogAction>? actions,
  }) async {
    assert(!(color == null && type == DialogType.custom),'Specify color when dialog type is custom');
    return showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      // barrierColor: Colors.white.withAlpha(50),
      builder: (BuildContext context) => GeneralDialog(
        content: content,
        title: title,
        actions:actions,
        type: type,
        icon: icon,
        titleStyle: titleStyle,
      ),
    );
  }
}

enum DialogType{
  info(color: Styles.colorPrimary,),
  warning(color: Styles.colorOrange,),
  custom();

  final Color? color;

  const DialogType({this.color});
}

class DialogAction{
  final String text;
  final Function callback;
  final Color color;
  final Color borderColor;
  final  Size? fixedSize;
  final  bool? isOneAction;
  DialogAction({
    required this.text,
    required this.callback,
    this.color = Styles.colorPrimary,
    this.borderColor = Colors.transparent,
    this.fixedSize,
    this.isOneAction
  });

}
