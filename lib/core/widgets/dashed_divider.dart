

import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight, dividerHeight;

  final Color dashColor;
  final Color? backgroundColor;

  const DividerWidget({
    this.totalWidth = 300,
    this.dashWidth = 10,
    this.emptyWidth = 5,
    this.dashHeight = 2,
    this.dashColor = Colors.black,
    this.backgroundColor,
    this.dividerHeight = 3,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: dividerHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          totalWidth ~/ (dashWidth + emptyWidth),
              (_) => Container(
            width: dashWidth,
            height: dashHeight,
            color: dashColor,
            margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}