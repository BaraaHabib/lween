import 'package:flutter/material.dart';
import 'package:lween/core/locale/locale_provider.dart';


class L10n {
  static final all = [
    const Locale(langEN),
    const Locale(langAr),
  ];

  static String getFlag(String code) {
    switch (code) {
      case langAr:
        return '🇦🇪';
      case langEN:
      default:
        return '🇺🇸';
    }
  }
}
