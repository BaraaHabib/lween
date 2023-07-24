import 'package:flutter/material.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/generated/l10n.dart';


class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    Key? key,
    this.message,
    this.actionTitle,
    this.onAction,
    this.topMargin,
  }) : super(key: key);
  final String? message;
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
          Text(
            message ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
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
