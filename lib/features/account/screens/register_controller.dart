

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_drop_down.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/params/register_params.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

class RegisterController extends Controller {
  final formKey = GlobalKey<FormBuilderState>();

  final passwordController = TextEditingController();

  @override
  init() {
    super.init();
    if (sl<AppStateModel>().countries.isNotEmpty) {
      selectedCountry = countriesData.firstOrNull;
      final cityData =  sl<AppStateModel>().cities(selectedCountry?.id).firstOrNull;
      if(cityData != null){
        selectedCity = DropdownItemDataModel(name: cityData.name!, id: cityData.id!);
      }
    }
  }

  List<DropdownItemDataModel>? get countryCities =>
      sl<AppStateModel>()
          .cities(selectedCountry?.id,).map((e) =>
          DropdownItemDataModel(
            name: e.name ?? '',
            id: e.id!,
          ),)
          .toList();


  List<DropdownItemDataModel> countriesData = sl<AppStateModel>()
      .countries.map((e) =>
      DropdownItemDataModel(
        name: e.name ?? '',
        id: e.id!,
      ),)
      .toList();

  final ValueNotifier<
      DropdownItemDataModel?> selectedCountryNotifier = ValueNotifier<
      DropdownItemDataModel?>(null);

  DropdownItemDataModel? get selectedCountry => selectedCountryNotifier.value;

  set selectedCountry(DropdownItemDataModel? value) {
    selectedCountryNotifier.value = value;
  }

  String? validateDropDownCountry(DropdownItemDataModel? value) {
    if (selectedCountry == null) {
      return S.current.pleaseSelectCountry;
    }
    return null;
  }

  DropdownItemDataModel? selectedCity;

  String? validateDropDownCity(DropdownItemDataModel? value) {
    return null;
    if (selectedCity == null) {
      return S.current.pleaseSelectCountry;
    }
    return null;
  }

  next(BuildContext context) {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
      sl<AccountBloc>().add(RegisterEvent(
        RegisterParams(
          body: RegisterParamsBody(
            name: formKey.currentState?.value['name'],
            cityId: formKey.currentState?.value['city']?.id ??
                countryCities?.first.id,
            password: formKey.currentState?.value['password'],
            confirmPassword: formKey.currentState?.value['confirm_password'],
            phoneNumber: formKey.currentState?.value['phone'],
          ),
        ),
      ));
    }
  }

  void listener(BuildContext context, AccountState state) {
    if (state is RegisterLoaded) {
      NavigationService.of(context).navigateTo(
        VerifyCodeScreenRoute(
            accountId: state.registerEntity.id,
            phoneNumber: formKey.currentState?.value['phone'],
        ),
      );
    }

    if (state is RegisterError) {
      AppToast(state.message ?? '').show();
    }
  }

  bool buildWhen(AccountState previous, AccountState current) {
    return current is RegisterState;
  }
}