import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/app_configuration.dart';
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
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

@RoutePage()
class LogInScreen extends HookWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = sl<AccountBloc>();
    final controller = Controller.getInstance(instance: LoginController(context,));
    return BlocBuilder<AccountBloc,AccountState>(
      bloc: bloc,
      builder:(ctc, state) => AbsorbPointer(
        absorbing: state is LogInLoading,
        child: AppScaffold(
          title: S.of(context).welcomeToLweenApp,
          withBackButton: false,
          backgroundImage: Assets.logInBackgroundPNG(context),
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
                      maxLength: 10,
                      formatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      // textAlign: TextAlign.center,
                      validator: CommonValidators.phone,
                      keyboardType: TextInputType.number,
                      hint: AppStateModel.of(context).inStoreObject('09********', '') ?? '',
                    ),
                    8.vSpace,
                    AppTextField(
                      name: 'password',
                      prefixIcon: SvgPicture.asset(Assets.lockIcon,),
                      type: AppTextFieldType.password,
                      label: S.current.password,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.minLength(minPasswordLength,),
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    15.vSpace,
                    Row(
                      children: [
                        AppTextButton(
                          onPressed: () => controller.forgotPassword(context,),
                          child: Text(
                            S.current.forgotPassword,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                              color: Styles.textButtonColor
                            ),
                          ),
                        ),
                      ],
                    ),
                    62.vSpace,
                    SizedBox(
                      height: 45.hx,
                      child: BlocConsumer<AccountBloc, AccountState>(
                        bloc: bloc,
                        listener: controller.listener,
                        buildWhen: controller.buildWhen,
                        builder: (ctx, cs) {
                          return AppGradientTextButton(
                            gradientType: AppTextButtonGradientType.primary,
                            isLoading: cs is LogInLoading,
                            onTap: () => controller.logIn(context),
                            content: S
                                .of(context)
                                .logIn,
                          );
                        },
                      ),
                    ),
                    14.vSpace,
                    SizedBox(
                      height: 45.hx,
                      child: AppGradientTextButton(
                        onTap: () => controller.signup(context,),
                        gradientType: AppTextButtonGradientType.secondary,
                        content: S.current.signup,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
