
import 'package:flutter/material.dart';
import 'package:lween/core/extended/numbers_ext.dart';

class Styles {

  static const Color colorPrimary = Color(0xFF13A7C8);
  static const Color colorSecondary = Color(0xFF2F455C);

  static const Color colorSecondary2 = Color(0xFF474747);

  static const Color scaffoldBackgroundColor = Colors.transparent;

  static const Color textButtonColor = Color(0xFF029BFA);
  static const Color radioButtonColor = Color(0xFF029BFA);

  static const lightFontColor = Color(0xFF110D32);
  static const darkFontColor = Color(0xFFFFFFFF);
  static const headLineFontColor = Color(0xFF89A3B4);

  /// text field styles
  static const textFieldColor = Color(0xFFFFFFFF);
  static const textFieldLabelColor = Color(0xFF89A3B4);

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

  static const liteGrayColor = Color(0xFF6D7276);
  static const colorGreen = Color(0xFF33CD84);

  static const yoloThemeColor = Color(0xFFE3E935);

  static const colorOrange = Color(0xFFFF6B3D);

  ///gradient color
  static const shadowColor = Color.fromARGB(64, 0, 0, 0);

  static double buttonBorderRadiusValue = 23.rx;

  static BorderRadius buttonBorderRadius =
  BorderRadius.all(Radius.circular(buttonBorderRadiusValue,));

  static const buttonTextColor = Color(0xFFFFFFFF);
  
  static const buttonPrimaryColor1 = Color(0xFF302B63);
  static const buttonPrimaryColor2 = Color(0xFF0F0C29);

  static const buttonSecondaryColor1 = Color(0xFF029BFA);
  static const buttonSecondaryColor2 = Color(0xFF0A7ADB);

  /// dialogs
  static const dialogBackgroundColor = Color(0xFFF4F9F9);
}

abstract class CommonSizes {
  static const empty = SizedBox.shrink();

  static const divider = Divider(thickness: 10);
}
