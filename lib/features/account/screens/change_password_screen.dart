import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/screens/change_password_controller.dart';
import 'package:lween/features/account/screens/reset_password_controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

@RoutePage()
class ChangePasswordScreen extends HookWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final controller = Controller.getInstance(instance: ChangePasswordController());
    final bloc = sl<AccountBloc>();
    final verticalSeparator = 30.vSpace;
    TextEditingController newPasswordController = useTextEditingController();
    return BlocConsumer<AccountBloc,AccountState>(
        bloc: bloc,
        listener: controller.listener,
        listenWhen: controller.listenAndBuildWhenWhen,
        buildWhen: controller.listenAndBuildWhenWhen,
        builder:(ctc, state) {
        return AppScaffold(
          title: S.of(context).changePassword,
          withBackButton: true,
          child: ListView(
            children: [
              40.vSpace,
              AppImage(
                path: Assets.changePasswordHeader,
                type: ImageType.asset,
                width: 220.wx,
                height: 166.hx,
              ),
              53.vSpace,
              SizedBox(
                height: 0.6.sh,
                child: FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      // 20.vSpace,
                      AppTextField(
                        name: 'current_password',
                        textAlign: TextAlign.center,
                        label: S.of(context).currentPassword,
                        prefixIcon: SvgPicture.asset(Assets.lockIcon,),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.minLength(minPasswordLength,),
                          FormBuilderValidators.required(),
                        ]),
                        type: AppTextFieldType.password,
                      ),
                      verticalSeparator,
                      AppTextField(
                        name: 'new_password',
                        textAlign: TextAlign.center,
                        controller: newPasswordController,
                        label: S.of(context).newPassword,
                        prefixIcon: SvgPicture.asset(Assets.lockIcon,),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.minLength(minPasswordLength,),
                          FormBuilderValidators.required(),
                        ]),
                        type: AppTextFieldType.password,
                      ),
                      verticalSeparator,
                      AppTextField(
                        name: 'confirm_password',
                        textAlign: TextAlign.center,
                        label: S.of(context).confirmPassword,
                        prefixIcon: SvgPicture.asset(Assets.lockIcon,),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.minLength(minPasswordLength,),
                          FormBuilderValidators.required(),
                          // FormBuilderValidators.equal(controller.formKey.currentState?.getRawValue('new_password'),errorText: S.current.passwordsDoesNotMatch),
                        ]),
                        type: AppTextFieldType.password,
                      ),
                      const Spacer(),
                      Builder(
                        builder: (ctx,) {
                          return AppGradientTextButton(
                            gradientType: AppTextButtonGradientType.primary,
                            isLoading: state is ChangePasswordLoading,
                            onTap: () => controller.changePassword(context),
                            content: S.of(context).saveChanges,
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
