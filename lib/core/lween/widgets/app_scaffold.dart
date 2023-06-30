

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/main.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.backgroundPNG,
            height: 1.sh,
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                10.vSpace,
                Row(
                  children: [
                    23.hSpace,
                    Text(
                      title,
                      style: Lween.theme.textTheme.titleLarge,
                    ),
                  ],
                ),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}