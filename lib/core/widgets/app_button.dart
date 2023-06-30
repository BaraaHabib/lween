import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/main.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.onTap,
    required this.content,
    this.color,
    this.borderColor,
    this.fixedSize
  }) : super(key: key);

  final Function()? onTap;
  final Widget content;
  final Color? color;
  final Color? borderColor;
  final Size? fixedSize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTap,
        style: Lween.theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: MaterialStateProperty.all(color),
          side: borderColor == null
              ? null
              : MaterialStateProperty.all(BorderSide(color: borderColor!)),
          fixedSize:fixedSize == null ? null: MaterialStateProperty.all(fixedSize!),
        ),
        child: content,
      ),
    );
  }
}

class ExpandedAppButton extends StatelessWidget {
  const ExpandedAppButton({
    Key? key,
    this.onTap,
    required this.content,
    this.color,
    this.borderColor,
    this.fixedSize
  }) : super(key: key);

  final Function()? onTap;
  final Widget content;
  final Color? color;
  final Color? borderColor;
  final Size? fixedSize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTap,
        style: Lween.theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: MaterialStateProperty.all(color),
          side: borderColor == null
              ? null
              : MaterialStateProperty.all(BorderSide(color: borderColor!)),
          fixedSize:fixedSize == null ? null: MaterialStateProperty.all(fixedSize!),
        ),
        child: Center(
           child: content,
        ),
      ),
    );
  }
}


enum AppTextButtonGradientType{
  primary,
  secondary,
}

class AppGradientTextButton extends HookWidget {
  const AppGradientTextButton({
    Key? key,
    this.onTap,
    required this.content,
    this.color,
    this.borderColor,
    this.fixedSize,
    this.gradientType,
  }) : super(key: key);

  final Function()? onTap;
  final String content;
  final Color? color;
  final Color? borderColor;
  final Size? fixedSize;
  final AppTextButtonGradientType? gradientType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fixedSize?.width ?? 312.wx,
      height: fixedSize?.height ?? 44.hx,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            if(gradientType == AppTextButtonGradientType.secondary)
              ...[
                Styles.buttonSecondaryColor1,
                Styles.buttonSecondaryColor2,

              ] else
              ...[
                Styles.buttonPrimaryColor1,
                Styles.buttonPrimaryColor2,
              ],
          ],
        ),
        borderRadius: Styles.buttonBorderRadius,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: Styles.buttonBorderRadius,
          ),
        ),
        child: Text(
          content,
          style: const TextStyle(
              color: Styles.buttonTextColor
          ),
        ),
      ),
    );
  }
}

