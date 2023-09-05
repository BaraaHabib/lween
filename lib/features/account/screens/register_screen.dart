import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/features/entities/shared/city.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/validators/common_validators.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_drop_down.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/screens/register_controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

@RoutePage()
class RegisterScreen extends HookWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fieldSeparator = 10.vSpace;
    final controller = Controller.getInstance(instance: RegisterController());
    // final countryValue = useValueListenable(controller.selectedCountryNotifier);

    final cities = useState<List<DropdownItemDataModel>?>(
        controller.countryCities);
    return BlocBuilder<AccountBloc,AccountState>(
      bloc: sl<AccountBloc>(),
      builder: (context,state) {
        return AbsorbPointer(
          absorbing: state is RegisterLoading,
          child: AppScaffold(
            backgroundImage: Assets.logInBackgroundPNG(context),
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
                    textCapitalization: TextCapitalization.words,
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
                    validator: CommonValidators.phone,
                    hint: AppStateModel.of(context).inStoreObject('09********') ?? '',
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
                    type: AppTextFieldType.password,
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
                          (value) {
                      if(value != controller.passwordController.text){
                        return S.of(context).passwordsDoesNotMatch;
                      }
                        return null;
                      }
                    ]),
                    prefixIcon: SvgPicture.asset(Assets.lockIcon,),
                    type: AppTextFieldType.password,
                  ),
                  20.vSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      18.hSpace,
                      Assets.locationIconWidget,
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
                          onChange: (v) {
                            controller.selectedCountry = v;
                            cities.value = controller.countryCities;
                          },
                          hintText: S.current.country,
                          name: 'country',
                          data: controller.countriesData,
                          validator: controller.validateDropDownCountry,
                          initValue: controller.countriesData.firstOrNull,
                        ),
                      ),
                      10.hSpace,
                      Flexible(
                        child: AppDropDownField(
                          onChange: (v) {
                            controller.selectedCity = v;
                          },
                          hintText: S
                              .of(context)
                              .city,
                          name: 'city',
                          data: cities.value ?? [],
                          validator: controller.validateDropDownCity,
                          initValue: controller.selectedCity,
                        ),
                      ),
                    ],
                  ),
                  70.vSpace,
                  BlocConsumer<AccountBloc, AccountState>(
                    bloc: sl<AccountBloc>(),
                    listener: controller.listener,
                    buildWhen: controller.buildWhen,
                    builder: (ctx, cs) {
                      return AppGradientTextButton(
                        gradientType: AppTextButtonGradientType.primary,
                        isLoading: cs is RegisterLoading,
                        onTap: () => controller.next(context),
                        content: S
                            .of(context)
                            .next,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
