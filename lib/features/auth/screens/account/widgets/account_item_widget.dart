
import 'package:flutter/material.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/bordered_container.dart';

class AccountItemWidget extends StatelessWidget {
  const AccountItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.onTap});


  final String icon;
  final String title;
  final String? value;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: InkSparkle.splashFactory,
      enableFeedback: false,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppImage(
                path: icon,
                type: ImageType.asset,
                width: 22.rx,
                height: 22.rx,
                fit: BoxFit.scaleDown,
                color: AppStateModel.of(context).isLightTheme ? Styles.brightGrayColor : null,
              ),
              20.hSpace,
              AppTextWidget(title, style: context.textTheme.titleMedium,)
            ],
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppTextWidget(value ?? '', style: context.textTheme.headlineMedium,),
              10.hSpace,
              SizedBox(
                  width: 20.rx,
                  height: 20.rx,
                  child: Assets.arrowRoundedWidget(context,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
