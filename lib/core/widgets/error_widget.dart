import 'package:flutter/material.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/main.dart';


class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    Key? key,
    this.entity,
    this.actionTitle,
    this.onAction,
    this.topMargin,
  }) : super(key: key);
  final String? entity;
  final String? actionTitle;
  final Function()? onAction;
  final double? topMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topMargin ?? 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 270.wx,
            height: 270.hx,
            child: const Icon(Icons.account_balance),
          ),
          25.vSpace,
          Text(
            S.of(context).sorryThereAreNoEntityYet(entity ?? ''),
            textAlign: TextAlign.center,
            style: Lween.theme.textTheme.displayMedium,
          ),
          35.vSpace,
          if (onAction != null)
            AppButton(
              onTap: onAction!,
              content: Text(
                actionTitle ?? S.current.retry,
              ),
            ),
        ],
      ),
    );
  }
}
