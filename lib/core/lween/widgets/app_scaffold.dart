

import 'package:auto_route/auto_route.dart';
import 'package:auto_route/src/router/controller/routing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/nav_icons.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/extensions.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/features/home/main_screen.dart';
import 'package:lween/generated/l10n.dart';
import 'package:provider/provider.dart';

part 'nav.dart';
class AppScaffold extends StatelessWidget {

  const AppScaffold({
    Key? key,
    required this.title,
    required this.child,
    this.withBackButton = true,
    this.centerTitle = false,
    this.padding,
    this.backgroundImage,
    this.onBackPressed,
    this.icon,
  }) : super(key: key);

  final String title;
  final String? backgroundImage;
  final Widget? icon;
  final Widget child;
  final bool withBackButton;
  final bool centerTitle;
  final EdgeInsetsGeometry? padding;
  final Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            backgroundImage ??  Assets.backgroundImage(context),
            height: 1.sh,
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
          child: Scaffold(
            body: Padding(
              padding: padding ?? EdgeInsetsDirectional.only(
                  start: 22.wx,
                  end: 18.wx
              ),
              child: Column(
                children: [
                  10.vSpace,
                  Row(
                    mainAxisAlignment: centerTitle
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,

                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          // textDirection: TextDirection.ltr,
                          children: [
                            if(icon != null)
                              Padding(
                                padding: const EdgeInsetsDirectional.only(end: 5,bottom: 5),
                                child: icon!,
                              ),
                            AppTextWidget(
                              title,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge,
                            ),

                          ],
                        ),
                      ),

                      if(withBackButton)
                        ...[
                          const Spacer(),
                          GestureDetector(
                            // fixedSize: Size(25.wx,25.hx),
                            // padding: EdgeInsets.zero,
                            onTap: onBackPressed ?? () {
                              // AutoTabsRouter.of(context).pop();
                              NavigationService
                                .of(context)
                                .pop();
                            },
                            child: Assets.previousIconWidget(context),
                          ),
                          // 24.hSpace,
                        ],
                    ],
                  ),
                  Expanded(
                    child: child,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}