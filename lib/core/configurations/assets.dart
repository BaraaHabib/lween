
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
  static Widget previousIconWidget(BuildContext context,{ThemeType? forceTheme, Color? color}) {
    if(color == null){
      color = AppStateModel.of(context).isLightTheme ?
      Colors.black : Colors.white;
      if(forceTheme != null){
        if(forceTheme == ThemeType.light){
          color = Colors.black;
        }else{
          color = Colors.white;

        }
      }
    }
    return Transform.rotate(
        angle: context.isDirectionRTL(context) ? 0 : pi,
        child: SvgPicture.asset(
            previousIcon,
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            )
        ),

      );
  }
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
  static const noNotificationsSVG = 'assets/icons/SVG/ic_no_notification.svg';

  static Widget arrowBackWidget(BuildContext context, {Color? color,bool reverse = false}) {
    double signe = 0;
    if(reverse){
      signe = pi;
    }
    return Transform.rotate(
        angle: signe + (context.isDirectionRTL(context) ? 0 : pi.sign),
        child: SvgPicture.asset(
            arrowBack,
          colorFilter: color == null ?
          null : ColorFilter.mode(color, BlendMode.srcIn,),
        ),
      );
  }
  static const arrowRoundedSVG = 'assets/icons/SVG/ic_arrow_rounded.svg';

  static Widget arrowRoundedWidget(BuildContext context, {Color? color,}) =>
      Transform.rotate(
        angle: context.isDirectionRTL(context) ? 0 : pi,
        child: SvgPicture.asset(
          arrowRoundedSVG,
        ),
      );

  static const doubleArrow = 'assets/icons/SVG/double_arrow.svg';

  static Widget doubleArrowWidget(BuildContext context) =>
      Transform.rotate(
        angle: context.isDirectionRTL(context) ? 0 : pi,
        child: SvgPicture.asset(doubleArrow),
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
      bookedSeatLightSVG :  bookedSeatDarkSVG;
  static const bookedSeatDarkSVG = 'assets/orders/SVG/seat-booked-dark.svg';
  static const bookedSeatLightSVG = 'assets/orders/SVG/seat-booked.svg';
  static const eyeSVG = 'assets/icons/SVG/ic_eye.svg';
  static const priceTagSVG = 'assets/orders/SVG/price-tag.svg';
  static const reservedSeatPNG = 'assets/orders/PNG/ic_reserved_seat.png';
  static String tripClockPNG(BuildContext context) =>AppStateModel.of(context).isLightTheme ? tripClockLightPNG
   : tripClockDarkPNG;
  static const tripClockDarkPNG = 'assets/orders/PNG/clock-dark.png';
  static const tripClockLightPNG = 'assets/orders/PNG/clock.png';
  static const busPNG = 'assets/orders/PNG/bus.png';
  static const microbusPNG = 'assets/orders/PNG/microbus.png';
  static const vanPNG = 'assets/orders/PNG/van.png';
  static const carPNG = 'assets/orders/PNG/car.png';
  static const otherPNG = 'assets/orders/SVG/wheel.svg';

  /// payment
  static const cashMobilePNG = 'assets/payment/cash_mobile.png';
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

  static const calendarSVG = 'assets/icons/SVG/calendar.svg';
  static const clockSVG = 'assets/icons/SVG/clock.svg';
  static const cameraSVG = 'assets/icons/SVG/camera.svg';

  static const busBgPNG = 'assets/images/bus_bg.png';


  /// trip gifs
  static const busGIF = 'assets/gifs/Bus.gif';
  static const busVIPGIF = 'assets/gifs/VIP-Bus.gif';
  static const microbusGIF = 'assets/gifs/Microbus.gif';
  static const vanGIF = 'assets/gifs/Van.gif';
  static const carGIF = 'assets/gifs/Car.gif';

  static const mBusGIF = 'assets/gifs/Bus3d.gif.mp4';
  static const mMicrobusGIF = 'assets/gifs/microbus3d.gif.mp4';
  static const mVanGIF = 'assets/gifs/Van3d.gif.mp4';
  static const mCarGIF = 'assets/gifs/Taxi3d.gif.mp4';


  /// account
  static const languageSVG = 'assets/account/SVG/language.svg';
  static const changePhoneNumberSVG = 'assets/account/SVG/ic_call_24px.svg';
  static const deleteAccountSVG = 'assets/account/SVG/ic_highlight_off_24px.svg';
  static const deactivateAccountSVG = 'assets/account/SVG/ic_not_interested_24px.svg';
  static const logOutSVG = 'assets/account/SVG/ic_settings_power_24px.svg';
  static const changePasswordSVG = 'assets/account/SVG/ic_vpn_key_24px.svg';
  static const darkModeIconSVG = 'assets/account/SVG/ic_brightness_2_24px.svg';
  static const lightModeIconSVG = 'assets/account/SVG/ic_brightness_high_24px.svg';
  static const accountSettingsPNG = 'assets/account/PNG/configuration.png';
  static const favouriteAccountPNG = 'assets/account/PNG/favourite.png';
  static const avatarPlaceHolderSVG = 'assets/account/SVG/avatar_placeholder.svg';
  static const editAccountSVG = 'assets/account/SVG/fi_6830003.svg';
  static const previousTripsIconPNG = 'assets/account/PNG/history.png';
  static const rewardIconSVG = 'assets/account/SVG/reward 1.svg';
  static const questionMarkIconPNG = 'assets/account/PNG/question-mark.png';
  static const ordersCountPNG = 'assets/account/SVG/school-bus.png';

}
