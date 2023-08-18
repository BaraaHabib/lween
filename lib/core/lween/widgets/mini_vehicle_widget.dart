

import 'package:flutter/material.dart';
import 'package:lween/core/extended/get_utils/src/extensions/context_extensions.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/bordered_container.dart';

class MiniVehicleWidget extends StatelessWidget {
  const MiniVehicleWidget({
    required this.travelMethodEnum,
    required this.travelMethodText,
    super.key});
  final VehicleType travelMethodEnum;
  final String? travelMethodText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BorderedContainer(
          width: 13.rx,
          height: 13.rx,
          gradientStartColor: travelMethodEnum.startMiniColor,
          gradientEndColor: travelMethodEnum.endMiniColor,
          startAlignment: AlignmentDirectional.bottomEnd,
          endAlignment: AlignmentDirectional.topStart,
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: AppImage(
              path: travelMethodEnum.icon,
              type: ImageType.asset,
              fit: BoxFit.scaleDown,
              color: Colors.white,
            ),
          ),
        ),
        3.hSpace,
        Expanded(
          child: AppTextWidget(
            travelMethodText ?? '',
            style: context.textTheme.headlineSmall,
            maxLines: 2,
          ),
        ),
        // 30.hSpace,
      ],
    );
  }
}
