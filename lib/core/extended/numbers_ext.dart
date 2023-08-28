import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../configurations/app_configuration.dart';

const dpi = 409;

extension NumExt on num {
  num toPrecision([int f = defaultFractionDigitsCount]) =>
      toDouble().toPrecision(f);

  ///[ScreenUtil.setWidth]
  double get wx => w;

  ///[ScreenUtil.setHeight]
  double get hx => h;

  ///[ScreenUtil.radius]
  double get rx => r;

  ///[ScreenUtil.setSp]
  double get spx => sp;

  Widget get vSpace =>
      SizedBox(
        height: hx,
      );

  Widget get hSpace =>
      SizedBox(
        width: wx,
      );
}
