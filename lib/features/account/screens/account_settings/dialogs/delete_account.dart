

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
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/screens/account/account_controller.dart';
import 'package:lween/generated/l10n.dart';

class DeleteAccountDialog extends HookWidget {
  const DeleteAccountDialog({super.key});


  @override
  Widget build(BuildContext context) {
    final AccountController controller = Controller.getInstance();
    return BlocConsumer<AccountBloc, AccountState>(
      bloc: AccountBloc.instance,
      listenWhen: controller.deleteAccountListenBuildWhen,
      buildWhen: controller.deleteAccountListenBuildWhen,
      listener: controller.deleteAccountListener,
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is DeleteAccountLoading,
          child: FormBuilder(
            key: controller.deleteAccountFormKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppTextWidget(
                        S.of(context).enterPasswordToContinueDeletingAccount,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: Styles.colorOrange,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                15.vSpace,
                AppTextField(
                  name: 'password',
                  label: S
                      .of(context)
                      .password,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.minLength(minPasswordLength,),
                    FormBuilderValidators.required(),
                  ]),
                  prefixIcon: SvgPicture.asset(Assets.lockIcon,),
                  type: AppTextFieldType.password,
                ),
                15.vSpace,
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 13,end: 13,),
                        child: AppGradientTextButton(
                          content: S.current.cancel,
                          onTap: () => NavigationService.of(context).pop(),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 13,end: 13,),
                        child: AppGradientTextButton(
                          withGradiant: false,
                          isLoading: state is DeleteAccountLoading,
                          color: Styles.colorOrange,
                          content: S.current.deleteAccount,
                          onTap: controller.confirmDeleteAccount,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
