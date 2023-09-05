import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/validators/common_validators.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/screens/login_controller.dart';
import 'package:lween/features/account/screens/reset_password_controller.dart';
import 'package:lween/features/account/screens/verify_code_controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

@RoutePage()
class ResetPasswordScreen extends HookWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Controller.getInstance(instance: ResetPasswordController());
    final bloc = sl<AccountBloc>();
    return BlocConsumer<AccountBloc,AccountState>(
        bloc: bloc,
        listener: controller.listener,
        listenWhen: controller.listenWhen,
        builder:(ctc, state) {
        return AppScaffold(
          title: S.of(context).resetPassword,
          withBackButton: true,
          child: ListView(
            children: [
              92.vSpace,
              Image.asset(
                Assets.forgotPasswordHeader,
                width: 250.wx,
                height: 166.hx,
              ),
              53.vSpace,
              SizedBox(
                height: 0.48.sh,
                child: FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).enterPhoneToSendCode,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                      60.vSpace,
                      AppTextField(
                        name: 'phone',
                        textAlign: TextAlign.center,
                        label: S.current.phoneNumber,
                        prefixIcon: SvgPicture.asset(
                          Assets.phoneIcon,
                        ),
                        validator: CommonValidators.phone,
                        hint: AppStateModel.of(context).inStoreObject('09********') ?? '',
                        keyboardType: TextInputType.number,
                      ),
                      const Spacer(),
                      Builder(
                        builder: (ctx,) {
                          return AppGradientTextButton(
                            gradientType: AppTextButtonGradientType.primary,
                            isLoading: state is ForgetPasswordLoading,
                            onTap: () => controller.resetPassword(context),
                            content: S
                                .of(context)
                                .send,
                          );
                        },
                      ),
                      107.vSpace,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
