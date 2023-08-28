part of 'themes.dart';

final textFieldBorder = OutlineInputBorder(
    borderRadius: Styles.textFieldBorderRadius,
    borderSide: const BorderSide(color: Colors.transparent)
);

final lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Tajawal',
  primaryColor: Styles.colorPrimaryLight,
  splashColor: Styles.colorPrimaryLight,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Styles.textFieldLightColor,
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
    hintStyle: TextStyle()
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(Styles.radioButtonColor),
  ),
  scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
  cardTheme: const CardTheme(
    color: Styles.lightCardColor,
    surfaceTintColor: Colors.transparent,
    shadowColor: Styles.darkCardShadowColor,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18.spx,
      color: Styles.lightFontColor,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.spx,
      color: Styles.lightFontColor,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11.spx,
      color: Styles.lightFontColor,
    ),
    headlineLarge: TextStyle(
      fontSize: 14.spx,
      color: Styles.headLineFontColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 12.spx,
      color: Styles.headLineFontColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 11.spx,
      color: Styles.headLineFontColor,
    ),
    labelLarge: TextStyle(
      fontSize: 15.spx,
      color: Styles.labelLightCardColor,
    ),
    labelMedium: TextStyle(
      fontSize: 13.spx,
      color: Styles.labelLightCardColor,
    ),
    labelSmall: TextStyle(
      fontSize: 11.spx,
      color: Styles.labelLightCardColor,
    ),
    displayLarge: TextStyle(
      fontSize: 14.spx,
      color: Styles.displayCardColor,
    ),
    displayMedium: TextStyle(
      fontSize: 12.spx,
      color: Styles.displayCardColor,
    ),
    displaySmall: TextStyle(
      fontSize: 11.spx,
      color: Styles.displayCardColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 14.spx,
      color: Styles.lightFontColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 11.spx,
      color: Styles.lightFontColor,
    ),
    bodySmall: TextStyle(
      fontSize: 9.spx,
      color: Styles.lightFontColor,
    ),
  ).apply(
    // bodyColor: Styles.lightFontColor,
    displayColor: Styles.headLineFontColor,
  ),
);

