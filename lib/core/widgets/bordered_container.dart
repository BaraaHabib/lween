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
    this.gradientStartColor, this.gradientEndColor,
    this.startAlignment, this.endAlignment,
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
  
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final AlignmentGeometry? startAlignment;
  final AlignmentGeometry? endAlignment;

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
        gradient: (gradientStartColor != null && gradientStartColor!= null) ? LinearGradient(
          colors:  [
            gradientStartColor!,
            gradientEndColor!
          ],
          begin: startAlignment ?? Alignment.centerLeft,
          end: endAlignment ?? Alignment.centerRight,
        )  : null,
        border: borderColor == null ? null : Border.all(color: borderColor!,),
        color: color,
      ),
      child: child,
    );
  }
}
class CircularShadowedContainer extends StatelessWidget {
  const CircularShadowedContainer({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.borderColor,
    this.radius,
    this.margin,
    this.padding,
    required this.child,
    this.shadowStartColor, this.shadowEndColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? color;
  final Color? shadowStartColor;
  final Color? shadowEndColor;
  final Color? borderColor;
  final double? radius;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255,255,255,1.5),
        border: Border.all(
          color: Colors.black,
          width: 1,
          style: BorderStyle.none,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(157,178,191,0.4),
            spreadRadius: 0,
            blurRadius: 1.5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );

  }
}
