import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.minimumSize,
    this.maximumSize,
    this.fixedSize,
    this.padding,
    this.tapTargetSize = MaterialTapTargetSize.shrinkWrap,
  }) : super(key: key);

  final Function() onPressed;
  final Widget child;
  final Size? maximumSize;
  final Size? minimumSize;
  final Size? fixedSize;
  final EdgeInsetsGeometry? padding;
  final MaterialTapTargetSize? tapTargetSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
        tapTargetSize: tapTargetSize,
        maximumSize: maximumSize,
        minimumSize: minimumSize,
        shadowColor: Colors.red,
        fixedSize: fixedSize,
        alignment: AlignmentDirectional.center,
        // elevation: 30
      ),
      child: child,
    );
  }
}
