import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/animated/animated_toggle.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/waiting_widget.dart';

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
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
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
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
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
    this.fontColor,
    this.borderColor,
    this.fixedSize,
    this.gradientType,
    this.fontSize,
    this.withGradiant = true,
    this.isLoading = false,
  }) : super(key: key);

  final Function()? onTap;
  final String content;
  final Color? color;
  final Color? fontColor;
  final Color? borderColor;
  final Size? fixedSize;
  final double? fontSize;
  final AppTextButtonGradientType? gradientType;
  final bool withGradiant;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fixedSize?.width ?? 312.wx,
      height: fixedSize?.height ?? 44.hx,
      decoration: BoxDecoration(
        color: color,
        gradient: withGradiant ? LinearGradient(
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
        ) : null,
        borderRadius: Styles.buttonBorderRadius,
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: Styles.buttonBorderRadius,
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: AnimatedCrossFade(
            duration: 300.milliseconds,
            firstChild: Text(
              content,
              style: TextStyle(
                color: fontColor ?? Styles.buttonTextColor,
                fontSize: fontSize,
              ),
            ),
            secondChild: Transform.scale(
                scale: 0.7,
                child: const WaitingWidget()),
            crossFadeState: isLoading
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ),
      ),
    );
  }
}

class AppGradientTextButtonWithIcon extends HookWidget {
  const AppGradientTextButtonWithIcon({
    Key? key,
    this.onTap,
    required this.content,
    this.color,
    this.borderColor,
    this.gradientType,
    this.fontSize,
    this.icon,
    this.padding,
  }) : super(key: key);

  final Function()? onTap;
  final String content;
  final Color? color;
  final Color? borderColor;
  final double? fontSize;
  final AppTextButtonGradientType? gradientType;
  final String? icon;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.zero,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if(icon != null)
              AppImage(
                type: ImageType.asset,
                path: icon!,
              ).paddingOnly(bottom: 4),
            5.hSpace,
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: Styles.buttonBorderRadius,
                ),
                padding: EdgeInsets.zero,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  content,
                  style: TextStyle(
                    color: Styles.buttonTextColor,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


