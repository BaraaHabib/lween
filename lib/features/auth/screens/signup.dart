import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_drop_down.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/features/auth/screens/signup_controller.dart';
import 'package:lween/generated/l10n.dart';

@RoutePage()
class RegisterScreen extends HookWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fieldSeparator = 30.vSpace;
    final controller = Controller.get(instance: SignupController());
    return AppScaffold(
      title: S
          .of(context)
          .signup,
      child: FormBuilder(
        key: controller.formKey,
        child: ListView(
          children: [
            42.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    S
                        .of(context)
                        .makeSureToEnterInformationAccuratly,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            25.vSpace,
            AppTextField(
              name: 'name',
              label: S
                  .of(context)
                  .fullName,
              prefixIcon: SvgPicture.asset(Assets.profileIcon,),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            fieldSeparator,
            AppTextField(
              name: 'phone',
              label: S
                  .of(context)
                  .phoneNumber,
              prefixIcon: SvgPicture.asset(Assets.phoneIcon,),
              keyboardType: TextInputType.number,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.equalLength(10),
              ]),
            ),
            fieldSeparator,
            AppTextField(
              name: 'password',
              controller: controller.passwordController,
              label: S
                  .of(context)
                  .password,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.minLength(minPasswordLength,),
                FormBuilderValidators.required(),
              ]),
              prefixIcon: SvgPicture.asset(Assets.lockIcon,),
            ),
            fieldSeparator,
            AppTextField(
              name: 'confirm_password',
              label: S
                  .of(context)
                  .confirmPassword,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.minLength(minPasswordLength,),
                FormBuilderValidators.required(),
              ]),
              prefixIcon: SvgPicture.asset(Assets.lockIcon,),
            ),
            36.vSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                18.hSpace,
                SvgPicture.asset(
                  Assets.locationIcon,
                ),
                13.hSpace,
                Expanded(
                  child: Text(
                    S
                        .of(context)
                        .placeOfResidence,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                )
              ],
            ),
            10.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: AppDropDownField(
                    onChange: (v) => controller.selectedCountry = v,
                    hintText: S.current.country,
                    name: 'country',
                    data: controller.countriesData,
                    validator: controller.validateDropDownGender,
                  ),
                ),
                24.hSpace,
                Flexible(
                  child: AppDropDownField(
                    onChange: (v) => controller.selectedCountry = v,
                    hintText: S.of(context).city,
                    name: 'city',
                    data: controller.countriesData,
                    validator: controller.validateDropDownGender,
                  ),
                ),
              ],
            ),
            80.vSpace,
            AppGradientTextButton(
              gradientType: AppTextButtonGradientType.primary,
              onTap: () => controller.next(context),
              content: S
                  .of(context)
                  .next,
            )
          ],
        ),
      ),
    );
  }
}
