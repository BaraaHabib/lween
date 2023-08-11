
import 'package:flutter/material.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';

class Styles {

  static Color colorPrimary = Color(0xFF13A7C8);
  static const Color colorSecondary = Color(0xFF2F455C);

  static const Color colorSecondary2 = Color(0xFF474747);

  static const Color scaffoldBackgroundColor = Colors.transparent;

  static const Color textButtonColor = Color(0xFF029BFA);
  static const Color radioButtonColor = Color(0xFF029BFA);

  /// label inside cards
  static const labelLightCardColor = Color(0xFF110D32);
  static const labelDarkCardColor = Color(0xFFFFFFFF);

  /// text inside cards (same in both modes)
  static const displayCardColor = Color(0xFF89A3B4);

  static const lightFontColor = Color(0xFF110D32);
  static const darkFontColor = Color(0xFFFFFFFF);
  static const headLineFontColor = Color(0xFF89A3B4);
  static const headLineDarkFontColor = Color(0xFFFFFFFF);

  /// text field styles
  static const textFieldLightColor = Color(0xFFFFFFFF);
  static const textFieldDarkColor = Color(0xFF213560);

  static const hintDarkColor = Color(0xFFFFFFFF);

  static Color textFieldColor(BuildContext context) =>
      AppStateModel
          .of(context)
          .isLightTheme ? textFieldLightColor : textFieldDarkColor;
  static const textFieldLabelColor = Color(0xFF89A3B4);
  static const textFieldFontColor = Color(0xFF110D32);

  static BorderRadius textFieldBorderRadius =
  BorderRadius.all(Radius.circular(textFieldBorderRadiusValue));
  static BorderRadius borderRadius40px =
  const BorderRadius.all(Radius.circular(40));
  static BorderRadius borderRadius30px =
  const BorderRadius.all(Radius.circular(30));
  static BorderRadius borderRadius25px =
  const BorderRadius.all(Radius.circular(25));
  static BorderRadius borderRadius16px =
  const BorderRadius.all(Radius.circular(16));
  static BorderRadius borderRadius14px =
  const BorderRadius.all(Radius.circular(14));
  static BorderRadius borderRadius12px =
  const BorderRadius.all(Radius.circular(12));
  static Radius circularBorderRadius30px = (const Radius.circular(30));
  static Radius circularBorderRadius25px = (const Radius.circular(25));
  static Radius circularBorderRadius20px = (const Radius.circular(20));
  static Radius circularBorderRadius18px = (const Radius.circular(18));
  static Radius circularBorderRadius14px = (const Radius.circular(14));
  static Radius circularBorderRadius12px = (const Radius.circular(12));
  static Radius circularBorderRadius8px = (const Radius.circular(8));
  static Radius circularBorderRadius4px = (const Radius.circular(4));

  static double textFieldBorderRadiusValue = 10.rx;
  static double textFieldBorder = 70.rx;
  static double textFieldBorderWidth = 1.5;

  static const liteGrayColor = Color(0xFF9EA0A2);
  static const brightGrayColor = Color(0xFF9DB2BF);

  static const colorGreen = Color(0xFF33CD84);

  static const yoloThemeColor = Color(0xFFE3E935);

  static const colorOrange = Color(0xFFFF6B3D);

  static double buttonBorderRadiusValue = 23.rx;

  static BorderRadius buttonBorderRadius =
  BorderRadius.all(Radius.circular(buttonBorderRadiusValue,));

  static const buttonTextColor = Color(0xFFFFFFFF);

  static const buttonPrimaryColor1 = Color(0xFF302B63);
  static const buttonPrimaryColor2 = Color(0xFF0F0C29);

  static const buttonSecondaryColor1 = Color(0xFF029BFA);
  static const buttonSecondaryColor2 = Color(0xFF0A7ADB);

  /// dialogs
  static const dialogLightBackgroundColor = Color(0xFFF4F9F9);
  static const dialogDarkBackgroundColor = Color(0xFF213560);

  static Color dialogBackgroundColor(BuildContext context) =>
      AppStateModel
          .of(context)
          .isLightTheme
          ? dialogLightBackgroundColor
          : dialogDarkBackgroundColor;

  /// card
  static const lightCardColor = Color(0xFFFFFFFF);
  static const darkCardColor = Color(0xFF213560);

  static Color cardBackgroundColor(BuildContext context) =>
      AppStateModel
          .of(context)
          .isLightTheme ? lightCardColor : darkCardColor;

  static const lightCardShadowColor = Colors.transparent;
  static const darkCardShadowColor = Colors.transparent;

  static const navbarLightBackgroundColor = Color(0xFFFFFFFF);
  static const navbarDarkBackgroundColor = Color(0xFF213560);

  static Color navbarBackgroundColor(BuildContext context) =>
      AppStateModel
          .of(context)
          .isLightTheme ?
      navbarLightBackgroundColor : navbarDarkBackgroundColor;
  static const selectedNavItemBackgroundColor = Color(0xFF029BFA);
  static const navActiveColor = Color(0xFF029BFA);
  static const navTextColor = Color(0xFFFFFFFF);
  static const navIconActiveColor = Color(0xFFFFFFFF);
  static const navUnselectedIcon = Color(0xFF9DB2BF);

  static const tripsCountTextColor = Color(0xFF029BFA,);
  static const followedIconColor = Color(0xFFFF6969,);

  /// shadow color
  static const shadowColor = Color.fromARGB(75, 157, 178, 191,);


  static const reservedSeatColor = Color(0xFFFF6969,);
  static const availableSeatColor = Color(0xFF9DB2BF);
  static const blueColor = Color(0xFF029BFA);


  static const warningColor = Color(0xFFFCF2C3);

  static Color dropDownFontColor(BuildContext context) =>
      AppStateModel
          .of(context)
          .isLightTheme ? dropDownFontLightColor : dropDownFontDarkColor;

  static const dropDownFontDarkColor = Color(0xFFFFFFFF);
  static const dropDownFontLightColor = Color(0xFF110D32);

  static Color selectedVehicleStartColor(BuildContext c) =>
      AppStateModel
          .of(c)
          .isLightTheme ?
      selectedVehicleStartLightColor : selectedVehicleStartDarkColor;
  static const selectedVehicleStartDarkColor = Color(0xFF029BFA);
  static const selectedVehicleStartLightColor = Color(0xFF110D32);

  static const selectedVehicleEndColor = Color(0xFF110D32);

  static Color unselectedVehicleColor(BuildContext c) =>
      AppStateModel
          .of(c)
          .isLightTheme ?
      unselectedVehicleLightColor : unselectedVehicleDarkColor;
  static const unselectedVehicleDarkColor = Color(0xFF89A3B4);
  static const unselectedVehicleLightColor = Color(0xFF9DB2BF);

  static const greenColor = Color(0xFF0FE1C4);
  static const ghostWhiteColor = Color(0xFFF9F9F9);

  static const labelInsideCard = Color(0xFF110D32);
  static const textInsideCard = Color(0xFF89A3B4);

  static Color unreadNotificationColor(BuildContext context) =>
      AppStateModel
          .of(context)
          .isLightTheme ?
      const Color(0xFFDBF1FF) : const Color(0xFF304980);

}

abstract class CommonSizes {
  static const empty = SizedBox.shrink();

  static const divider = Divider(thickness: 10);
}
