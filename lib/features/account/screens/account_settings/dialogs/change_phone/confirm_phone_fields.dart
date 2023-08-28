
part of 'change_phone.dart';

class ConfirmPhoneFields extends HookWidget {
  const ConfirmPhoneFields({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePhoneDialogController controller = Controller.getInstance();
    return Column(
      children: [
        10.vSpace,
        AppTextField(
          name: 'code',
          controller: controller.codeController,
          textAlign: TextAlign.start,
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
        const ResendButton()
      ],
    );
  }
}
