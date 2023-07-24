

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/generated/l10n.dart';

class OrderFromToScreen extends HookWidget {
  const OrderFromToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: S
          .of(context)
          .bookATrip,
      child: Column(
        children: [
          AppImage(path: Assets.bookMapLocation,
            type: ImageType.asset,
            width: 310.wx,
            height: 180.hx,
          )
        ],
      ),
    );
  }
}
