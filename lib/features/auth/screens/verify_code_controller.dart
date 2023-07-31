

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/features/auth/bloc/account_bloc.dart';
import 'package:lween/features/auth/params/check_code_params.dart';
import 'package:lween/features/auth/params/resend_code_params.dart';
import 'package:lween/features/auth/params/verify_account_params.dart';
import 'package:lween/features/onboarding/bloc/splash_bloc.dart';
import 'package:lween/injection_container.dart';

class VerifyCodeController extends Controller{
  final bloc = sl<AccountBloc>();
  final formKey = GlobalKey<FormBuilderState>();
  final int accountId;
  final String phoneNumber;

  VerifyCodeController(this.accountId,this.phoneNumber,);

  verifyCode(BuildContext context) {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
      bloc.add(VerifyAccountEvent(
        params: VerifyAccountParams(
          body: VerifyAccountParamsBody(
            accountId: accountId,
            confirmationCode: formKey.currentState?.value['code'],
          ),
        ),
      ));
    }
    // NavigationService.of(context).navigateTo(const VerifyCodeScreenRoute(),);
  }

  void listener(BuildContext context, AccountState state) {
    if(state is VerifyAccountError){
      AppToast(state.message ?? '').show();
    }
    else if(state is VerifyAccountLoaded){
      sl<AppStateModel>().logIn(
          token: state.verifyAccountEntity.accessToken,
        expires: state.verifyAccountEntity.expireInSeconds,
        refreshToken: state.verifyAccountEntity.refreshToken,
      ).then((value) {
        SplashBloc.initApp(context);
        NavigationService.of(context).clearAllAndPushNamed(const MainScreenRoute());
      });
    }
  }

  bool buildWhen(AccountState previous, AccountState current) {
    return current is VerifyAccountState;
  }

  resendCode() {
    bloc.add(
      ResendCodeEvent(
        params: ResendCodeParams(
          userName: phoneNumber,
          confirmationCodeType: ConfirmationCodeType.confirmAccount,
        ),
      ),
    );
  }
}