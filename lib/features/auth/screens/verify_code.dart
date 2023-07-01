import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:lween/features/auth/screens/verify_code_controller.dart';
import 'package:lween/generated/l10n.dart';

@RoutePage()
class VerifyCodeScreen extends HookWidget {
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Controller.get(instance: VerifyCodeController());
    return AppScaffold(
      title: S.of(context).confirmAccount,
      withBackButton: true,
      child: ListView(
        shrinkWrap: true,
        children: [
          59.vSpace,
          Image.asset(
            Assets.verifyPhoneHeader,
            width: 164.wx,
            height: 164.hx,
          ),
          56.vSpace,
          SizedBox(
            height: 0.5.sh,
            child: FormBuilder(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      8.hSpace,
                      Text(
                        S.of(context).enterVerificationCode,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  15.vSpace,
                  AppTextField(
                    name: 'code',
                    textAlign: TextAlign.center,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    keyboardType: TextInputType.number,
                  ),
                  28.vSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        Assets.refreshIcon,
                      ),
                      4.hSpace,
                      AppTextButton(
                        onPressed: () {
                        },
                        child: Text(
                          S.of(context).resendCode,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                            color: Styles.textButtonColor
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  AppGradientTextButton(
                    onTap: () => controller.verifyCode(context,),
                    content: S.of(context).enter,
                  ),
                  90.vSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
