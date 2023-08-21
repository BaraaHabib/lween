

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:logger/logger.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/params/login_params.dart';
import 'package:lween/features/account/screens/dialogs/language_dialog.dart';
import 'package:lween/features/onboarding/bloc/splash_bloc.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';
import 'package:lween/main.dart';
import 'package:provider/provider.dart';

class LoginController extends Controller {
  final formKey = GlobalKey<FormBuilderState>();
  final BuildContext context;

  LoginController(this.context);

  @override
  void init() {
    super.init();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if ( true
      // !Lween.locale.initLanguageSelected
      ){
        AppDialogs.showGeneralDialog(
          context: Lween.navigatorKey.currentContext!,
          title: S.current.selectPreferredLanguage,
          content: const LanguageDialog(),
        );
      }
    });
  }

  signup(context) {
    NavigationService.of(context).navigateTo(const RegisterScreenRoute());
  }

  logIn(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState?.saveAndValidate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
      sl<AccountBloc>().add(LogInEvent(
        params: LogInParams(
            body: LogInParamsBody(
              rememberClient: true,
              userName: formKey.currentState?.value['phone'],
              password: formKey.currentState?.value['password'],
            )
        ),
      ),
      );
    }
  }

  void listener(BuildContext context, AccountState state) {
    if(state is LogInLoaded){
      sl<AppStateModel>().logIn(
        token: state.logInEntity.accessToken,
        expires: state.logInEntity.expireInSeconds,
        refreshToken: state.logInEntity.refreshToken,
      ).then((value) {
        SplashBloc.initApp(context)
            .then((value) => NavigationService.of(context).clearAllAndPushNamed(const MainScreenRoute()));
      });
    }
    else if(state is LogInError){
      if(state.code == 9 && state.accountId is int){
        NavigationService.of(context).navigateTo(
            VerifyCodeScreenRoute(
                accountId:state.accountId!,
                phoneNumber: formKey.currentState?.value['phone'],
            ),
        );
      }else{
        AppToast(state.message ?? '').show();
      }
    }
  }

  bool buildWhen(AccountState previous, AccountState current) {
    return current is LogInState;
  }

  forgotPassword(context) {
    // AppDialogs.showRetryDialog(context: context, content: 'ddd');
    NavigationService.of(context).navigateTo(const ResetPasswordScreenRoute());
  }
}