part of 'themes.dart';

final textDarkFieldBorder = OutlineInputBorder(
    borderRadius: Styles.textFieldBorderRadius,
    borderSide: const BorderSide(color: Colors.transparent)
);

final darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Tajawal',
  primaryColor: Styles.colorPrimary,
  splashColor: Styles.colorPrimary,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Styles.textFieldColor,
    filled: true,
    border: textDarkFieldBorder,
    enabledBorder: textDarkFieldBorder,
    errorBorder: textDarkFieldBorder,
    focusedBorder: textDarkFieldBorder,
    focusedErrorBorder: textDarkFieldBorder,
    disabledBorder: textDarkFieldBorder,
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
  cardTheme: const CardTheme(
    color: Styles.darkCardColor,
    surfaceTintColor: Colors.transparent,
    shadowColor: Styles.darkCardShadowColor,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18.spx,
      color: Styles.darkFontColor,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.spx,
      color: Styles.darkFontColor,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11.spx,
      color: Styles.darkFontColor,
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
      color: Styles.labelCardColor,
    ),
    labelMedium: TextStyle(
      fontSize: 13.spx,
      color: Styles.labelCardColor,
    ),
    labelSmall: TextStyle(
      fontSize: 11.spx,
      color: Styles.labelCardColor,
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
      color: Styles.darkFontColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 11.spx,
      color: Styles.darkFontColor,
    ),
    bodySmall: TextStyle(
      fontSize: 9.spx,
      color: Styles.darkFontColor,
    ),
  ).apply(
    // bodyColor: Styles.darkFontColor,
    displayColor: Styles.headLineFontColor,
  )
);