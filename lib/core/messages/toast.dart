import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/main.dart';

import 'app_system_message.dart';

const toastDuration = Duration(seconds: 3);

class AppToast extends AppSystemMessage {
  AppToast(String message)
      : super(type: AppSystemMessageTyp.toast, message: message);

  @override
  show() {
    toast(Function() cancel) => AnimatedToast(
      text: message,
    );
    var cancel = BotToast.showWidget(
        toastBuilder: toast,
    );
    return 3.delay().then((value) {
      cancel.call();
    });
    // return Future.value();
  }
}

class AnimatedToast extends HookWidget{

  final String text;

  const AnimatedToast({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: 400.milliseconds,
      tween: Tween(
        begin: 0,
        end: 1,
      ),
      builder: (ctx, value, child) => Opacity(
        opacity: value,
        child: child,
      ),
      child: IntrinsicHeight(
        child: Material(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 50.hx),
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: context.theme.primaryColor,
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
                    child: AppTextWidget(
                      text,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
