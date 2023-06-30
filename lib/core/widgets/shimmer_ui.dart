import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lween/core/configurations/styles/styles.dart';

abstract class ShimmerUI {
  static Widget text({double? w, double? h}) => Container(
        height: h ?? 80.h,
        width: w ?? 300.w,
        decoration: BoxDecoration(
          borderRadius: Styles.borderRadius30px,
          color: Styles.colorPrimary,
        ),
      );

  static Widget widget(
          [double h = 10, double w = 10, Color color = Colors.white]) =>
      Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: Styles.borderRadius30px,
        ),
      );

  static Widget circle([double d = 10]) => Container(
        height: d,
        width: d,
        decoration: BoxDecoration(
          color: Styles.colorPrimary,
          borderRadius: Styles.borderRadius30px,
        ),
      );

  static widgetLoader({
    required Widget child,
    bool enabled = false,
  }) =>
      !enabled
          ? child
          : Shimmer.fromColors(
              enabled: true,
              baseColor: Styles.colorPrimary,
              highlightColor: Styles.colorSecondary,
              loop: 0,
              child: child,
            );
}

abstract class ShimmerBase extends StatelessWidget {
  const ShimmerBase({super.key});

  final backgroundColor = const Color.fromARGB(10, 0, 0, 0);
}
