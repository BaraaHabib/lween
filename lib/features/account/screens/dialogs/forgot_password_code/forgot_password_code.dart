import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/extended/string_ext.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/params/check_code_params.dart';
import 'package:lween/features/account/params/enter_forgot_password_params.dart';
import 'package:lween/features/account/params/resend_code_params.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

part 'password_fields.dart';
part 'resend_button.dart';

class ForgotPasswordCodeDialog extends HookWidget {
  const ForgotPasswordCodeDialog({
    super.key,
    required this.phone,
    required this.onSuccess,
  });

  final String phone;
  final Function() onSuccess;

  @override
  Widget build(BuildContext context) {
    final controller = Controller.getInstance(
      instance: ForgotPasswordCodeDialogController(phone),);
    return BlocConsumer<AccountBloc, AccountState>(
        bloc: sl<AccountBloc>(),
        listener: controller.listener,
        buildWhen: controller.buildWhen,
        builder: (ctx, cs) {
          return AbsorbPointer(
            absorbing:
            cs is ResendCodeLoading ||
            cs is CheckCodeLoading,
            child: FormBuilder(
              key: controller.formKey,
              child: ValueListenableBuilder(
                  valueListenable: controller.checkedCode,
                  builder: (context, isCodeChecked, child,) {
                    return Column(
                      children: [
                        8.vSpace,
                        AppTextField(
                          name: 'code',
                          textAlign: TextAlign.start,
                          enabled: !isCodeChecked,
                          prefixIcon: SvgPicture.asset(Assets.checkCodeSVG,),
                          label: S
                              .of(context)
                              .verificationCode,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            // FormBuilderValidators.equalLength(4),
                          ]),
                          keyboardType: TextInputType.number,
                        ),
                        AnimatedCrossFade(
                          firstChild: ResendButton(state: cs),
                          secondChild: const PasswordsFields(),
                          crossFadeState: isCodeChecked ? CrossFadeState
                              .showSecond : CrossFadeState.showFirst,
                          duration: 300.milliseconds,
                        ),
                        20.vSpace,
                        SizedBox(
                          height: 45.hx,
                          child: Builder(
                            builder: (ctx,) {
                              return AppGradientTextButton(
                                gradientType: AppTextButtonGradientType.primary,
                                isLoading: cs is EnterForgotPasswordLoading ||
                                    cs is CheckCodeLoading,
                                onTap: () => controller.nextStep(context),
                                content: S
                                    .of(context)
                                    .ok,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
              ),
            ),
          );
        }
    );
  }
}

class ForgotPasswordCodeDialogController extends Controller {
  final formKey = GlobalKey<FormBuilderState>();
  final bloc = sl<AccountBloc>();
  final checkedCode = ValueNotifier(false);
  TextEditingController passwordController = TextEditingController();
  final String phone;

  ForgotPasswordCodeDialogController(this.phone);

  void listener(BuildContext context, AccountState state) {
    if(state is CheckCodeLoaded){
      checkedCode.value = true;
    }
    else if(state is EnterForgotPasswordLoaded){
      AppToast(S.of(context).passwordUpdatedSuccessfully).show();
      NavigationService.of(context).popUntilRout(LogInScreenRoute.name,);
    }
    else if(state is ResendCodeLoaded){
      AppToast(S.of(context).codeWasResentToYourNumber).show();
    }
    else{
      if(!state.message.isNullOrEmpty){
        AppToast(state.message ?? '').show();
      }
    }
  }

  bool buildWhen(AccountState previous, AccountState current) {
    return current is EnterForgotPasswordState || current is CheckCodeState || current is ResendCodeState;
  }

  nextStep(BuildContext context) {
    if(!(formKey.currentState?.fields['code']?.validate() ?? false)){
      return;
    }
    if (!checkedCode.value) {
      FocusManager.instance.primaryFocus?.unfocus();
      bloc.add(
        CheckCodeEvent(
          params: CheckCodeParams(
            code: formKey.currentState?.fields['code']?.value,
            userName: phone,
            confirmationCodeType: ConfirmationCodeType.forgetPassword,
          ),
        ),
      );
    }
    else {
      if(
          !(formKey.currentState?.fields['password']?.validate() ?? false) ||
          !(formKey.currentState?.fields['confirm_password']?.validate() ?? false)
      ){
        return;
      }
      FocusManager.instance.primaryFocus?.unfocus();
      bloc.add(
        EnterForgotPasswordEvent(
          params: EnterForgotPasswordParams(
            body: EnterForgotPasswordParamsBody(
              code: formKey.currentState?.fields['code']?.value,
              username: phone,
              password: formKey.currentState?.fields['password']?.value,
              confirmPassword: formKey.currentState?.fields['confirm_password']?.value,
            ),
          ),
        ),
      );
    }
  }

  resendCode() {
    bloc.add(
      ResendCodeEvent(
        params: ResendCodeParams(
          userName: phone,
          confirmationCodeType: ConfirmationCodeType.forgetPassword,
        ),
      ),
    );
  }
}
