import 'package:flutter/material.dart';
import 'package:lween/core/configurations/styles/styles.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.borderColor,
    this.radius,
    this.margin,
    this.padding,
    required this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final double? radius;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: radius == null
            ? Styles.borderRadius30px
            : BorderRadius.all(Radius.circular(radius!)),
        border: borderColor == null ? null : Border.all(color: borderColor!,),
        color: color,
      ),
      child: child,
    );
  }
}
