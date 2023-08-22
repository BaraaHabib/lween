import 'package:flutter/material.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_image.dart';

import '../../../generated/l10n.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget(
      {Key? key,
      this.entity,
      this.actionTitle,
      this.onAction,
      this.topMargin,
      this.imageAssetPath,
      this.fullMessage,
      })
      : super(key: key);
  final String? entity;
  final String? actionTitle;
  final Function()? onAction;
  final double? topMargin;
  final String? imageAssetPath;
  final String? fullMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topMargin ?? 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(imageAssetPath != null)
            AppImage(
              path: imageAssetPath,
              type: ImageType.asset,
              fit: BoxFit.scaleDown,
              width: 150.rx,
              height: 150.rx,
            ),
          // 10.vSpace,
          Text(
            fullMessage ?? S.of(context).sorryThereAreNoEntityYet(entity ?? ''),
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          25.vSpace,
          if (onAction != null && actionTitle != null)
            AppButton(
              onTap: onAction!,
              content: Text(actionTitle!),
            ),
        ],
      ),
    );
  }
}
