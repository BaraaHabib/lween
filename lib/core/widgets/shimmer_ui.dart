import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lween/core/configurations/styles/styles.dart';

abstract class ShimmerUI {
  static Widget text({double? w, double? h}) =>
      Container(
        height: h ?? 15.hx,
        width: w ?? 120.wx,
        decoration: BoxDecoration(
          borderRadius: Styles.borderRadius30px,
            color: Colors.grey.withOpacity(0.5),
        ),
      );

  static Widget widget(
      {
        double? h,
        double? w,
        Color? color,
        BorderRadiusGeometry? borderRadius,
      }) =>
      Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: color ?? Colors.grey.withOpacity(0.5),
          borderRadius: borderRadius,
        ),
      );

  static Widget circle([double d = 10, BorderRadiusGeometry? borderRadius ]) =>
      Container(
        height: d,
        width: d,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: borderRadius ?? Styles.borderRadius30px,
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

        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!.withOpacity(0.5),
        // baseColor: Styles.liteGrayColor,
        // highlightColor: Styles.liteGrayColor.withOpacity(0.5),
        loop: 0,
        direction: ShimmerDirection.ltr,
        period: shimmerDuration,
        child: child,
      );
}

abstract class ShimmerBase extends StatelessWidget {
  const ShimmerBase({super.key});

  final backgroundColor = const Color.fromARGB(10, 0, 0, 0);
}
