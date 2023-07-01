

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.child,
    required this.title,
    this.withBackButton = true,
  }) : super(key: key);

  final String title;
  final Widget child;
  final bool withBackButton;

  @override
  Widget build(BuildContext context) {
    final appState = Provider
        .of<AppStateModel>(context, listen: false);
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.backgroundImage(context),
            height: 1.sh,
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 28.wx,
                  end: 24.wx
              ),
              child: Column(
                children: [
                  10.vSpace,
                  Row(
                    children: [
                      Text(
                        title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge,
                      ),
                      if(withBackButton)
                        ...[
                          const Spacer(),
                          GestureDetector(
                            // fixedSize: Size(25.wx,25.hx),
                            // padding: EdgeInsets.zero,
                            onTap:
                            NavigationService
                                .of(context)
                                .pop,
                            child: SvgPicture.asset(
                              Assets.previousIcon,
                              colorFilter: ColorFilter.mode(
                                appState.isLightTheme ?
                                Colors.black : Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
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
        Positioned(
          right: 100,
          left: 100,
          bottom: 10,
          child: FloatingActionButton(
            mini: true,
            onPressed: Provider
              .of<AppStateModel>(context, listen: false)
              .toggleTheme,
            child: const Icon(Icons.edit_attributes_outlined,),
          ),
        )
      ],
    );
  }
}