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
    labelStyle: const TextStyle(
      color: Styles.textFieldLabelColor,
    ),
    alignLabelWithHint: true,
    floatingLabelStyle: const TextStyle(
      color: Styles.textFieldLabelColor,
    ),
  ),
  scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
);

