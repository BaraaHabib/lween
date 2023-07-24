
/// mixin to store paths to application assets

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/context_ext.dart';
import 'package:provider/provider.dart';
class Assets {
  static const splashScreen = 'assets/onboarding/intro.mp4';
  static const logoPNG = 'assets/logo.png';
  static const logInHeader = 'assets/auth/login.png';
  static const verifyPhoneHeader = 'assets/auth/verification.png';
  static const forgotPasswordHeader = 'assets/auth/forgot_password.png';
  static const profileIcon = 'assets/auth/SVG/Profile.svg';
  static const lockIcon = 'assets/auth/SVG/ic_lock_outline_24px.svg';
  static const phoneIcon = 'assets/auth/SVG/ic_phone_24px.svg';
  static const previousIcon = 'assets/previous.svg';
  static Widget previousIconWidget(BuildContext context) =>
      Transform.rotate(
        angle: context.isDirectionRTL(context) ? 0 : pi,
        child: SvgPicture.asset(
            previousIcon,
            colorFilter: ColorFilter.mode(
              AppStateModel.of(context).isLightTheme ?
              Colors.black : Colors.white,
              BlendMode.srcIn,
            )
        ),

      );
  static const locationIcon = 'assets/auth/SVG/ic_place_24px.svg';

  static Widget get locationIconWidget =>
      SvgPicture.asset(
        locationIcon,
      );
  static const refreshIcon = 'assets/auth/SVG/ic_sync_24px.svg';
  static const arabicIcon = 'assets/auth/arabic.png';
  static const englishIcon = 'assets/auth/english.png';

  /// navigation
  static const homeNavIcon = 'assets/nav/SVG/Home.svg';
  static const notificationsNavIcon = 'assets/nav/SVG/notifications.svg';
  static const bookNavIcon = 'assets/nav/SVG/seo.svg';
  static const myTicketsNavIcon = 'assets/nav/SVG/ticket.svg';
  static const myProfileNavIcon = 'assets/nav/SVG/user.svg';

  /// orders
  static const tripOrderIcon = 'assets/orders/SVG/trip.svg';
  static const orderDateIcon = 'assets/orders/SVG/date.svg';

  static Widget get orderDateIconWidget => SvgPicture.asset(orderDateIcon);

  static String backgroundImage(BuildContext context) {
    var isLightTheme = AppStateModel
        .of(context)
        .isLightTheme;
    if (isLightTheme) {
      return backgroundPNG;
    }
    return darkBackgroundPNG;
  }

  static logInBackgroundPNG(BuildContext context) =>
      AppStateModel.of(context).isLightTheme ? logInLightBackgroundPNG : logInDarkBackgroundPNG;

  static const logInLightBackgroundPNG = 'assets/onboarding/login_background.jpg';
  static const logInDarkBackgroundPNG = 'assets/onboarding/login_dark_background.png';
  static const backgroundPNG = 'assets/background.png';
  static const darkBackgroundPNG = 'assets/onboarding/login_dark_background.png';

  static const arrowBack = 'assets/icons/SVG/ic_back.svg';

  static Widget arrowBackWidget(BuildContext context) =>
      Transform.rotate(
        angle: context.isDirectionRTL(context) ? 0 : pi,
        child: SvgPicture.asset(arrowBack),
      );

  /// icons
  static const tripCountSVG = 'assets/icons/SVG/ic_trip_count.svg';
  static const unfollowedIconSVG = 'assets/icons/SVG/ic_unfollowed.svg';
  static const followedIconSVG = 'assets/icons/SVG/ic_followed.svg';
  static const ticketIconSVG = 'assets/icons/SVG/ic_ticket.svg';

  static Widget followIconSVG(bool isFollowed) =>
      Transform.scale(
        scale: 1.3,
        child: SvgPicture.asset(
          isFollowed ? followedIconSVG : unfollowedIconSVG,
        ),
      );


  /// Orders
  static const bookMapLocation = 'assets/orders/PNG/map-location.png';

}
