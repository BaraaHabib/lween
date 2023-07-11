
/// mixin to store paths to application assets

import 'package:flutter/material.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:provider/provider.dart';
class Assets {
  static const splashScreen = 'assets/onboarding/splash.png';
  static const logoPNG = 'assets/logo.png';
  static const logInHeader = 'assets/auth/login.png';
  static const verifyPhoneHeader = 'assets/auth/verification.png';
  static const forgotPasswordHeader = 'assets/auth/forgot_password.png';
  static const profileIcon = 'assets/auth/SVG/Profile.svg';
  static const lockIcon = 'assets/auth/SVG/ic_lock_outline_24px.svg';
  static const phoneIcon = 'assets/auth/SVG/ic_phone_24px.svg';
  static const previousIcon = 'assets/previous.svg';
  static const locationIcon = 'assets/auth/SVG/ic_place_24px.svg';
  static const refreshIcon = 'assets/auth/SVG/ic_sync_24px.svg';
  static const arabicIcon = 'assets/auth/arabic.png';
  static const englishIcon = 'assets/auth/english.png';

  /// navigation
  static const homeNavIcon = 'assets/nav/SVG/Home.svg';
  static const notificationsNavIcon = 'assets/nav/SVG/notifications.svg';
  static const bookNavIcon = 'assets/nav/SVG/seo.svg';
  static const myTicketsNavIcon = 'assets/nav/SVG/ticket.svg';
  static const myProfileNavIcon = 'assets/nav/SVG/user.svg';

  static String backgroundImage(BuildContext context){
    var isLightTheme = Provider.of<AppStateModel>(context,listen: false).isLightTheme;
    if(isLightTheme){
      return backgroundPNG;
    }
    return darkBackgroundPNG;
  }
  static const backgroundPNG = 'assets/background.png';
  static const darkBackgroundPNG = 'assets/dark_background.png';
}
