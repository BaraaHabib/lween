
part of 'forgot_password_code.dart';

class PasswordsFields extends HookWidget {
  const PasswordsFields({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordCodeDialogController controller = Controller.getInstance();
    return Column(
      children: [
        10.vSpace,
        AppTextField(
          name: 'password',
          controller: controller.passwordController,
          label: S
              .of(context)
              .password,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.minLength(
              minPasswordLength,),
            FormBuilderValidators.required(),
          ]),
          prefixIcon: SvgPicture.asset(Assets.lockIcon,),
          type: AppTextFieldType.password,
        ),
        10.vSpace,
        AppTextField(
          name: 'confirm_password',
          label: S
              .of(context)
              .confirmPassword,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.minLength(
              minPasswordLength,),
            FormBuilderValidators.required(),
                (value) {
              if (value !=
                  controller.passwordController.text) {
                return S
                    .of(context)
                    .passwordsDoesNotMatch;
              }
              return null;
            }
          ]),
          prefixIcon: SvgPicture.asset(Assets.lockIcon,),
          type: AppTextFieldType.password,
        ),
        20.vSpace,
      ],
    );
  }
}
