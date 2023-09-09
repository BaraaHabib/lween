import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lween/core/storage/shared_preferences/shared_preferences_items.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/main.dart';

import 'L10n.dart';

const langAr = 'ar';
const langEN = 'en';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale(langAr);

  Locale get currentLocale => _locale;

  //#region app languages

  bool _initLanguageSelected = false;
  bool get initLanguageSelected => _initLanguageSelected;


  set initLanguageSelected(bool value){
    _initLanguageSelected = value;
    Lween.appState.prefs.setBool(SharedPreferencesKeys.LANGUAGE_SELECTED, value,);
  }
  //#endregion

  factory LocaleProvider.of(BuildContext context) => Provider.of<LocaleProvider>(context,listen: false);

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
    await S.load(type);
    notifyListeners();
    return true;
  }

  List<LanguageItem> languages =
  [
    LanguageItem('العربية', langAr, Assets.arabicIcon,),
    LanguageItem('English', langEN, Assets.englishIcon,),
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
        return 'en-us';
      case langAr:
        return 'ar-sy';
      default:
        return 'ar-sy';
    }
  }

  Future fetchLocale(SharedPreferences prefs) async {

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
        Locale(prefs.getString(SharedPreferencesKeys.LanguageCode) ?? langAr);
    return Null;
  }

  bool get isLTR => !_locale.languageCode.contains('ar');

  bool get isRTL => !isLTR;

  bool get isEN => _locale.languageCode == langEN;
  bool get isAR => _locale.languageCode == langAr;

  ui.TextDirection get textDirection =>
      isLTR ? ui.TextDirection.ltr : ui.TextDirection.rtl;

  init() {
    // init localizations
    final local = Lween.appState.prefs.containsKey(
      SharedPreferencesKeys.LanguageCode,
    )
        ? Lween.appState.prefs.getString(SharedPreferencesKeys.LanguageCode)
        : langAr;

    changeLanguageWithoutRestart(
      Locale(local ?? langAr),
    );
  }

  LocaleProvider();
}

class LanguageItem{
  final String name;
  final String code;
  final String icon;

  LanguageItem(this.name, this.code, this.icon);
}