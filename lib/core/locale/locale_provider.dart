import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lween/core/storage/shared_preferences/shared_preferences_items.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/main.dart';

import 'L10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale("en");

  Locale get locale => _locale;

  //#region app languages
  static const langAr = 'ar';
  static const langEN = 'en';
  //#endregion

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) {
      return;
    }
    _locale = locale;
  }

  /// This for know if this first time run the application or not
  bool _firstStart = false;

  bool get firstStart => _firstStart;

  void setFirstStart(bool val) {
    _firstStart = val;
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }

  Future<void> changeLanguageWithoutRestart(
    Locale type,
  ) async {
    final appState = Lween.appState;
    if (_locale == type) {
      return;
    }
    if (type == const Locale(langAr)) {
      _locale = const Locale(langAr);
    } else {
      _locale = const Locale(langEN);
    }
    await appState.prefs
        .setString(SharedPreferencesKeys.LanguageCode, _locale.languageCode);
    setLocale(type);
    // S.load(type);
    S.load(type);
    notifyListeners();
  }

  List<String> languages = [
    'English',
    'Arabic',
  ];

  String get selectedLanguageText {
    switch (_locale.languageCode) {
      case langEN:
        return languages[0];
      case langAr:
        return languages[1];
      default:
        return languages[1];
    }
  }

  String get selectedLanguageHeader {
    switch (_locale.languageCode) {
      case langEN:
        return 'en-GB';
      case langAr:
        return 'ar-SY';
      default:
        return 'en-GB';
    }
  }

  Future fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    /// check if the application is first start or not
    if (prefs.getBool(SharedPreferencesKeys.KEY_FIRST_START) == null) {
      /// set first start is true
      await prefs.setBool(SharedPreferencesKeys.KEY_FIRST_START, true);

      /// Set first time run the application true
      setFirstStart(true);
    } else {
      setFirstStart(false);
    }
    if (prefs.getString(SharedPreferencesKeys.LanguageCode) == null) {
      _locale = const Locale(langAr);
      await prefs.setString(SharedPreferencesKeys.LanguageCode, langAr);
      return Null;
    }
    _locale =
        Locale(prefs.getString(SharedPreferencesKeys.LanguageCode) ?? 'ar');
    return Null;
  }

  bool get isLTR => _locale.languageCode != 'ar';

  bool get isRTL => !isLTR;
  bool get isEN => _locale.languageCode == langEN;

  ui.TextDirection get textDirection =>
      isLTR ? ui.TextDirection.ltr : ui.TextDirection.rtl;

  init() {
    // init localizations
    final local = Lween.appState.prefs.containsKey(
      SharedPreferencesKeys.LanguageCode,
    )
        ? Lween.appState.prefs.getString(SharedPreferencesKeys.LanguageCode)
        : 'en';

    changeLanguageWithoutRestart(
      Locale(local ?? 'en'),
    );
  }
}
