import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/params/check_code_params.dart';
import 'package:lween/features/account/params/resend_code_params.dart';
import 'package:lween/features/account/repo/account_repository.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

part 'confirm_phone_fields.dart';
part 'resend_button.dart';

class ChangePhoneDialog extends HookWidget {
  const ChangePhoneDialog({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Controller.getInstance(
      instance: ChangePhoneDialogController(),);
    return BlocConsumer<AccountBloc, AccountState>(
        bloc: sl<AccountBloc>(),
        listener: controller.listener,
        buildWhen: controller.buildWhen,
        builder: (ctx, cs) {
          return IgnorePointer(
            ignoring:
            cs is ResendCodeLoading ||
            cs is CheckCodeLoading,
            child: FormBuilder(
              key: controller.formKey,
              child: ValueListenableBuilder(
                  valueListenable: controller.codeRequested,
                  builder: (context, isCodeChecked, child,) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          8.vSpace,
                          AppTextField(
                            name: 'phone',
                            prefixIcon: SvgPicture.asset(Assets.phoneIcon,),
                            label: S.of(context).newPhoneNumber,
                            enabled: !controller.codeRequested.value,

                            maxLength: 10,
                            formatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                                  (v) => v is String && v.startsWith('09') ? null : S.of(context).phoneShouldStartWith09,
                              FormBuilderValidators.equalLength(10),
                            ]),
                            keyboardType: TextInputType.number,
                            hint: '09********',
                          ),
                          if (controller.codeRequested.value)
                            Row(
                              children: [
                                AppTextButton(
                                  onPressed: controller.backToEnterPhoneNumber,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox.square(
                                        dimension: 9.rx,
                                        child: Assets.arrowBackWidget(
                                          context,
                                          color: Styles.textButtonColor,
                                          reverse: true,),
                                      ),
                                      AppTextWidget(
                                        S.current.changePhoneNumber,
                                        strutStyle: const StrutStyle(
                                          height: 1.4,
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                          color: Styles.blueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          AnimatedCrossFade(
                            firstChild: const SizedBox.shrink(),
                            secondChild: const ConfirmPhoneFields(),
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
                                  isLoading: cs is RequestChangePhoneLoading ||
                                      cs is ConfirmChangePhoneCodeLoading,
                                  onTap: () => controller.nextStep(context),
                                  content: S
                                      .of(context)
                                      .ok,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
          );
        }
    );
  }
}

class ChangePhoneDialogController extends Controller {
  final formKey = GlobalKey<FormBuilderState>();
  final bloc = sl<AccountBloc>();
  final codeRequested = ValueNotifier(false);
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  ChangePhoneDialogController();

  void listener(BuildContext context, AccountState state) {
    if(state is RequestChangePhoneLoaded){
      codeRequested.value = true;
    }
    else if(state is ConfirmChangePhoneCodeLoaded){
      AppToast(S.of(context).phoneNumberChangesSuccessfully,).show();
      AccountBloc.instance.add(const GetProfileEvent(),);
      // AccountRepository.profile?.phoneNumber = formKey.currentState?.getRawValue('phone',);
      NavigationService.of(context).pop();
    }
    else if(state is ResendCodeLoaded){
      AppToast(S.of(context).codeWasResentToYourNumber,
      ).show();
    }
    else{
      if(!state.message.isNullOrEmpty){
        AppToast(state.message ?? '').show();
      }
    }
  }

  bool buildWhen(AccountState previous, AccountState current) {
    return current is RequestChangePhoneState ||
        current is ConfirmChangePhoneCodeState ||
        current is ResendCodeState;
  }

  nextStep(BuildContext context) {
    if(!(formKey.currentState?.fields['phone']?.validate() ?? false)){
      return;
    }
    if (!codeRequested.value) {
      FocusManager.instance.primaryFocus?.unfocus();
      bloc.add(
        RequestChangePhoneEvent(
            formKey.currentState?.fields['phone']?.value,
        ),
      );
    }
    else {
      if(
          !(formKey.currentState?.fields['code']?.validate() ?? false) ||
          !(formKey.currentState?.fields['password']?.validate() ?? false)
      ){
        return;
      }
      FocusManager.instance.primaryFocus?.unfocus();
      bloc.add(
        ConfirmChangePhoneCodeEvent(
          password: formKey.currentState?.fields['password']?.value,
          code: formKey.currentState?.fields['code']?.value,
        ),
      );
    }
  }

  resendCode() {
    bloc.add(
      ResendCodeEvent(
        params: ResendCodeParams(
          userName: AccountRepository.profile!.phoneNumber!,
          confirmationCodeType: ConfirmationCodeType.changePhoneNumber,
        ),
      ),
    );
  }

  backToEnterPhoneNumber() {
    passwordController.text = '';
    codeController.text = '';
    codeRequested.value = false;
  }
}
