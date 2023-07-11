

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
        // GNav(
        //     rippleColor: Colors.grey[800]!, // tab button ripple color when pressed
        //     hoverColor: Colors.grey[700]!, // tab button hover color
        //     haptic: true, // haptic feedback
        //     tabBorderRadius: 15,
        //     tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
        //     tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
        //     tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
        //     curve: Curves.easeOutExpo, // tab animation curves
        //     duration: Duration(milliseconds: 900), // tab animation duration
        //     gap: 8, // the tab button gap between icon and text
        //     color: Colors.grey[800], // unselected icon color
        //     activeColor: Colors.purple, // selected icon and text color
        //     iconSize: 24, // tab button icon size
        //     tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
        //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
        //     tabs: [
        //       GButton(
        //         icon: IconData(),
        //         text: 'Home',
        //       ),
        //       GButton(
        //         icon: LineIcons.heart_o,
        //         text: 'Likes',
        //       ),
        //       GButton(
        //         icon: LineIcons.search,
        //         text: 'Search',
        //       ),
        //       GButton(
        //         icon: LineIcons.user,
        //         text: 'Profile',
        //       )
        //     ]
        // )
      ],
    );
  }
}