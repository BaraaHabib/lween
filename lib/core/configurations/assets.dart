
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
  static String tripOrderIcon(BuildContext context)
  => AppStateModel.of(context).isLightTheme ? tripOrderIconLight : tripOrderDarkIcon;
  static const tripOrderIconLight = 'assets/orders/SVG/trip.svg';
  static const tripOrderDarkIcon = 'assets/orders/PNG/trip-dark.png';
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
  static const logInDarkBackgroundPNG = 'assets/dark_background.png';
  static const backgroundPNG = 'assets/background.png';
  static const darkBackgroundPNG = 'assets/dark_background.png';

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
  static String bookMapLocation(BuildContext context) => AppStateModel.of(context).isLightTheme ?
  bookMapLocationLight : bookMapLocationDark;
  static const bookMapLocationDark = 'assets/orders/PNG/map-location-dark.jpg';
  static const bookMapLocationLight = 'assets/orders/PNG/map-location.png';
  static const seatSVG = 'assets/orders/SVG/seat.svg';
  static String bookedSeat(BuildContext context) =>
      AppStateModel.of(context).isLightTheme ?
      bookedSeatDarkSVG :  bookedSeatLightPng;
  static const bookedSeatDarkSVG = 'assets/orders/SVG/seat-booked.svg';
  static const bookedSeatLightPng = 'assets/orders/PNG/seat-booked-dark.png';
  static const eyeSVG = 'assets/icons/SVG/ic_eye.svg';
  static const priceTagSVG = 'assets/orders/SVG/price-tag.svg';
  static const reservedSeatPNG = 'assets/orders/PNG/ic_reserved_seat.png';

  /// payment
  static const mtnPNG = 'assets/payment/mtn.png';
  static const syriatelPNG = 'assets/payment/syriatel.png';
  static const bemoPNG = 'assets/payment/bemo.png';
  static const cashPNG = 'assets/payment/cash.png';
  static const fatoraPNG = 'assets/payment/fatora_logo.png';
  static const fatoraDarkPNG = 'assets/payment/fatora_logo_dark.png';
  static String eCashPNG(BuildContext context) => AppStateModel.of(context).isLightTheme ?
  eCashLightPNG : eCashDarkPNG;
  static const eCashDarkPNG = 'assets/payment/e_cash_logo_dark.png';
  static const eCashLightPNG = 'assets/payment/e_cash_logo_light.png';
  static String fatoraLogoPNG(BuildContext context) =>
      AppStateModel.of(context).isLightTheme ? fatoraPNG : fatoraDarkPNG;
  static const warningPNG = 'assets/payment/warning.png';


}
