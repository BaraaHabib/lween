import 'package:flutter/material.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/extended/get_utils/src/extensions/export.dart';
import 'package:lween/core/locale/locale_provider.dart';

/// this should be used to show text instead of [Text] widget
/// to fix language direction
class AppTextWidget extends StatelessWidget {
  const AppTextWidget(this.text,
      {
        Key? key,
        this.style,
        this.maxLines,
        this.textDirection,
        this.overflow,
        this.textAlign
      }) : super(key: key);

  final TextStyle? style;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final String text;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      // textDirection: textDirection ?? text.preferredDirection,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign,
      strutStyle: StrutStyle(
        // fontFamily: 'FontName',
        // forceStrutHeight: true,
        fontSize: style?.fontSize,
        // height: LocaleProvider.of(context).isRTL ? 1.2 : 1.5,
      ),
    );
  }
}
