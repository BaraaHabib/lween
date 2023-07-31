

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/features/auth/bloc/account_bloc.dart';
import 'package:lween/features/auth/params/forget_password_params.dart';
import 'package:lween/features/auth/params/enter_forgot_password_params.dart';
import 'package:lween/features/auth/screens/dialogs/forgot_password_code/forgot_password_code.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

class ResetPasswordController extends Controller{
  final formKey = GlobalKey<FormBuilderState>();



  resetPassword(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState?.saveAndValidate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
      sl<AccountBloc>().add(ForgetPasswordEvent(
        params: ForgetPasswordParams(
          phone: formKey.currentState?.value['phone']
        ),
      ),
      );
    }
  }

  showEnterCodeDialog(context) {
    AppDialogs.showGeneralDialog(
      context: context,
      title: S
          .of(context)
          .enterVerificationCode,
      content: ForgotPasswordCodeDialog(
        phone: formKey.currentState?.value['phone'],
        onSuccess: () {},
      ),
      type: DialogType.info,
    );
  }

  void listener(BuildContext context, AccountState state) {
    if(state is ForgetPasswordError){
      AppToast(state.message ?? '').show();
    }
    else if(state is ForgetPasswordLoaded){
      showEnterCodeDialog(context);
    }
  }

  bool listenWhen(AccountState previous, AccountState current) => current is ForgetPasswordState;
}