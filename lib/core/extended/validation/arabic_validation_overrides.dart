import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class OverrideFormBuilderLocalizationsAr
    extends FormBuilderLocalizationsImplAr {
  OverrideFormBuilderLocalizationsAr();

  static const LocalizationsDelegate<FormBuilderLocalizationsImpl> delegate =
  _LocalizationsDelegate();

  static const List<Locale> supportedLocales = [Locale('ar')];

  // Override a field and return your translation.
  @override
  String get requiredErrorText => 'هذا الحقل مطلوب';
}

class _LocalizationsDelegate
    extends LocalizationsDelegate<FormBuilderLocalizationsImpl> {
  const _LocalizationsDelegate();

  @override
  Future<FormBuilderLocalizationsImpl> load(Locale locale) {
    final instance = OverrideFormBuilderLocalizationsAr();
    // IMPORTANT!! must to invoke setCurrentInstance()
    FormBuilderLocalizations.setCurrentInstance(instance);
    return SynchronousFuture<FormBuilderLocalizationsImpl>(instance);
  }

  @override
  bool isSupported(Locale locale) =>
      OverrideFormBuilderLocalizationsAr.supportedLocales.contains(locale);

  @override
  bool shouldReload(_LocalizationsDelegate old) => false;
}