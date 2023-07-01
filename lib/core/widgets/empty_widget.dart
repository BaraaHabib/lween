import 'package:flutter/material.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/app_button.dart';

import '../../../generated/l10n.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget(
      {Key? key,
      this.entity,
      this.actionTitle,
      this.onAction,
      this.topMargin,
      required this.imageAssetPath})
      : super(key: key);
  final String? entity;
  final String? actionTitle;
  final Function()? onAction;
  final double? topMargin;
  final String imageAssetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topMargin ?? 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              imageAssetPath,
            ),
            width: 270.wx,
            height: 270.hx,
          ),
          25.vSpace,
          Text(
            S.of(context).sorryThereAreNoEntityYet(entity ?? ''),
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          35.vSpace,
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
