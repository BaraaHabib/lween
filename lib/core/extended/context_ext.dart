import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

extension ByuldContextExt on BuildContext {
  bool isDirectionRTL(BuildContext context) {
    return intl.Bidi.isRtlLanguage(
        Localizations.localeOf(context).languageCode);
  }

  TextDirection textDirection(BuildContext context) {
    return intl.Bidi.isRtlLanguage(Localizations.localeOf(context).languageCode)
        ? TextDirection.rtl
        : TextDirection.ltr;
  }
}
