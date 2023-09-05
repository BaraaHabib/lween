
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

abstract class CommonValidators {
  static FormFieldValidator<Object> get phone {
    final isInStoreReview = sl<AppStateModel>().initAppEntity.inStoreReview ??
        false;
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      if(!isInStoreReview)
        ...[
              (v) =>
          v is String && v.startsWith('09') ? null : S.current
              .phoneShouldStartWith09,
          if(isInStoreReview)
            FormBuilderValidators.equalLength(10),
        ],
    ]);
  }
}