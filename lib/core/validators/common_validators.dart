
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/generated/l10n.dart';

// abstract class CommonValidators{
//   static FormFieldValidator<Object> password() = FormBuilderValidators.compose([
//     FormBuilderValidators.minLength(minPasswordLength,),
//     FormBuilderValidators.required(),
//         (value) {
//       if(value != controller.passwordController.text){
//         return S.current.passwordsDoesNotMatch;
//       }
//       return null;
//     }
//   ]);
// }