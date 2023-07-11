import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lween/core/storage/shared_preferences/shared_preferences_items.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/main.dart';

import 'L10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale("ar");

  Locale get locale => _locale;

  //#region app languages
  static const langAr = 'ar';
  static const langEN = 'en';

  bool _initLanguageSelected = false;
  bool get initLanguageSelected => _initLanguageSelected;
  set initLanguageSelected(bool value){
    _initLanguageSelected = value;
    Lween.appState.prefs.setBool(SharedPreferencesKeys.LANGUAGE_SELECTED, value,);
  }
  //#endregion

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) {
      return;
    }
    _locale = locale;
  }

  /// This for know if this first time run the application or not
  bool _firstStart = true;

  bool get firstStart => _firstStart;

  void setFirstStart(bool val) {
    _firstStart = val;
    SharedPreferences.getInstance().then((value) {
      value.setBool(
          SharedPreferencesKeys.KEY_FIRST_START, val);
    });
  }

  Future<bool> changeLanguageWithoutRestart(Locale type,) async {
    final appState = Lween.appState;
    if (_locale == type) {
      return false;
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
    return true;
    // notifyListeners();
  }

  List<LanguageItem> languages =
  [
    LanguageItem('عربية', 'ar', Assets.arabicIcon,),
    LanguageItem('English', 'en', Assets.englishIcon,),
  ];


  String get selectedLanguageText {
    switch (_locale.languageCode) {
      case langAr:
        return languages[0].name;
      case langEN:
        return languages[1].name;
      default:
        return languages[0].name;
    }
  }

  String get selectedLanguageHeader {
    switch (_locale.languageCode) {
      case langEN:
        return 'en-US';
      case langAr:
        return 'ar-SY';
      default:
        return 'ar-SY';
    }
  }

  Future fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    /// check if language selected
    if (prefs.getBool(SharedPreferencesKeys.LANGUAGE_SELECTED) == null) {
      /// set first start is true
      await prefs.setBool(SharedPreferencesKeys.LANGUAGE_SELECTED, false);

      /// Set first time run the application true
      _initLanguageSelected = false;
    } else {
      _initLanguageSelected = prefs.getBool(SharedPreferencesKeys.LANGUAGE_SELECTED,) ?? false;
    }
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
        : 'ar';

    changeLanguageWithoutRestart(
      Locale(local ?? 'ar'),
    );
  }
}

class LanguageItem{
  final String name;
  final String code;
  final String icon;

  LanguageItem(this.name, this.code, this.icon);
}