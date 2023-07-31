import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';

enum WaitingWidgetType{
  normal,
  pulse,
}

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({
    this.type = WaitingWidgetType.normal,
    this.scale = 1,
    Key? key,
  }) : super(key: key);

  final WaitingWidgetType type;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Builder(builder: (ctx) {
        switch (type) {
          case WaitingWidgetType.pulse:
            return SpinKitPulse(
              color: context.theme.primaryColor,
              size: 50.0,
            );
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      }),
    );
  }
}
