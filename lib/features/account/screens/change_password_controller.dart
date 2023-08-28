

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

class ChangePasswordController extends Controller{
  final formKey = GlobalKey<FormBuilderState>();



  changePassword(context) {
    formKey.currentState?.save();
    final currentPassword = formKey.currentState?.getRawValue(
        'current_password');
    final newPassword = formKey.currentState?.getRawValue('new_password');
    final confirmPassword = formKey.currentState?.getRawValue(
        'confirm_password');

    if(newPassword != confirmPassword){
      formKey.currentState?.fields['confirm_password']?.invalidate(S.current.passwordsDoesNotMatch,);
      return;
      // formKey.currentState?.
    }
    if (formKey.currentState?.validate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
      sl<AccountBloc>().add(ChangePasswordEvent(
        currentPassword: currentPassword,
        newPassword: newPassword,
      ),
      );
    }
  }


  void listener(BuildContext context, AccountState state) {
    if(state is ChangePasswordError){
      AppToast(state.message ?? '').show();
    }
    else if(state is ChangePasswordLoaded){
      AppToast(S.of(context).passwordChangedSuccessfully,).show();
      NavigationService
          .of(context)
          .pop();
    }
  }

  bool listenAndBuildWhenWhen(AccountState previous, AccountState current) => current is ChangePasswordState;
}