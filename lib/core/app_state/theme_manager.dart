


part of 'appstate.dart';

enum ThemeType{
  light,
  dark
}

mixin ThemeManager implements AppStateComponent {
  ThemeType currentThemeType = ThemeType.light;
  
  ThemeData get currentThemeData => currentThemeType == ThemeType.light ? lightTheme : darkTheme;

  bool get isLightTheme => currentThemeType == ThemeType.light;

  toggleTheme() {
    int newThemeIndex = currentThemeType.index + 1;
    currentThemeType = ThemeType.values[(newThemeIndex % 2)];
    notifyListeners();
  }
}