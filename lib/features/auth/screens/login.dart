import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/features/auth/screens/login_controller.dart';
import 'package:lween/generated/l10n.dart';

@RoutePage()
class LogInScreen extends HookWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Controller.get(instance: LoginController());
    return AppScaffold(
      title: S.of(context).welcomeToLweenApp,
      withBackButton: false,
      child: ListView(
        children: [
          37.vSpace,
          Image.asset(
            Assets.logInHeader,
            width: 164.wx,
            height: 164.hx,
          ),
          56.vSpace,
          FormBuilder(
            key: controller.formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    8.hSpace,
                    Text(
                      S.current.logIn,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                15.vSpace,
                AppTextField(
                  name: 'phone',
                  prefixIcon: SvgPicture.asset(Assets.profileIcon,),
                  label: S.current.phoneNumber,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.equalLength(10),
                  ]),
                  keyboardType: TextInputType.number,
                  hint: '09********',
                ),
                8.vSpace,
                AppTextField(
                  name: 'password',
                  prefixIcon: SvgPicture.asset(Assets.lockIcon,),
                  type: AppTextFieldType.password,
                  label: S.current.password,
                  validator: FormBuilderValidators.required(),
                ),
                28.vSpace,
                Row(
                  children: [
                    AppTextButton(
                      onPressed: () {
                      },
                      child: Text(
                        S.current.forgotPassword,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                          color: Styles.textButtonColor
                        ),
                      ),
                    ),
                  ],
                ),
                62.vSpace,
                AppGradientTextButton(
                  onTap: controller.logIn,
                  content: S.current.logIn,
                ),
                14.vSpace,
                AppGradientTextButton(
                  onTap: () => controller.signup(context,),
                  gradientType: AppTextButtonGradientType.secondary,
                  content: S.current.signup,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
