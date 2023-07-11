part of 'themes.dart';

final textFieldBorder = OutlineInputBorder(
    borderRadius: Styles.textFieldBorderRadius,
    borderSide: const BorderSide(color: Colors.transparent)
);

final lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Tajawal',
  primaryColor: Styles.colorPrimary,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Styles.textFieldColor,
    filled: true,
    border: textFieldBorder,
    enabledBorder: textFieldBorder,
    errorBorder: textFieldBorder,
    focusedBorder: textFieldBorder,
    focusedErrorBorder: textFieldBorder,
    disabledBorder: textFieldBorder,
    labelStyle: const TextStyle(
      color: Styles.textFieldLabelColor,
    ),
    alignLabelWithHint: true,
    floatingLabelStyle: const TextStyle(
      color: Styles.textFieldLabelColor,
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(Styles.radioButtonColor),
  ),
  scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18.spx,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.spx,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11.spx,
    ),
    headlineLarge: TextStyle(
      fontSize: 14.spx,
      color: Styles.headLineFontColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 12.spx,
      color: Styles.headLineFontColor,
    ),
  ).apply(
    bodyColor: Styles.lightFontColor,
    displayColor: Styles.headLineFontColor,
  ),
);

