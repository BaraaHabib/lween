import 'package:flutter/material.dart';
import 'package:lween/core/configurations/styles/styles.dart';

class DatePicker {
 static Future<DateTime?> showCustomDatePicker (BuildContext context,DateTime initialDate){
  return  showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data:  ThemeData.light().copyWith(
              textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Styles.colorSecondary2, // button text color
              ),
            ),
              colorScheme: ColorScheme.fromSeed(
              background: Styles.colorPrimary,
              primary: Styles.colorPrimary, // header background color
              // onPrimary:Styles.colorSecondary2, // header title
              surface: Styles.colorSecondary2,
              // outline: Styles.yoloThemeColor,
              secondary:  Styles.yoloThemeColor,
              onSecondary:  Styles.yoloThemeColor,
              seedColor:  Styles.yoloThemeColor
            ),
          ),
          child: child!,
        );
      },
    );
  }
}