


part of 'appstate.dart';

enum ThemeType{
  light,
  dark
}

mixin ThemeManager implements AppStateComponent {
  static ThemeType currentThemeType = ThemeType.light;

  static SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle(
    statusBarIconBrightness: currentThemeType == ThemeType.light ? Brightness.dark :  Brightness.light ,
    systemNavigationBarColor: currentThemeType == ThemeType.light ? Styles.colorPrimaryLight :  Styles.colorPrimaryDark,
    systemNavigationBarIconBrightness: currentThemeType == ThemeType.light ? Brightness.dark :  Brightness.light ,
  );

  ThemeData get currentThemeData => currentThemeType == ThemeType.light ? lightTheme : darkTheme;

  bool get isLightTheme => currentThemeType == ThemeType.light;

  static ThemeType initTheme(SharedPreferences prefs) {
    var storedThemeIndex = prefs.getInt(SharedPreferencesKeys.THEME,);
    if (storedThemeIndex == null) {
      var brightness = SchedulerBinding.instance.platformDispatcher
          .platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      if (isDarkMode) {
        currentThemeType = ThemeType.dark;
      }
      else {
        currentThemeType = ThemeType.light;
      }
    }
    else {
      currentThemeType =
      ThemeType.values[prefs.getInt(SharedPreferencesKeys.THEME,)!];
    }
    return currentThemeType;
  }
  
  toggleTheme() async {
    int newThemeIndex = (currentThemeType.index + 1) % 2;
    currentThemeType = ThemeType.values[newThemeIndex];
    await saveTheme(newThemeIndex);
    SystemChrome.setSystemUIOverlayStyle(ThemeManager.systemUiOverlayStyle,);
    notifyListeners();
  }
  
   saveTheme(int index) async {
    await sl<AppStateModel>().prefs.setInt(SharedPreferencesKeys.THEME, index,);
  }
}