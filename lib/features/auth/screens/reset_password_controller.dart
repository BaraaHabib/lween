

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/generated/l10n.dart';

class ResetPasswordController extends Controller{
  final formKey = GlobalKey<FormBuilderState>();



  resetPassword(context) {
    AppDialogs.showGeneralDialog(
        context: context,
        title: 'أدخل رمز التحقق',
      content: Column(
          children: [
            AppTextField(
              name: 'phone',
              textAlign: TextAlign.center,
              label: S.of(context).verificationCode,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.equalLength(10),
              ]),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          DialogAction(
              text: S.current.send,
              callback: (){},
          )
        ],
        type: DialogType.info,
    );
  }
}