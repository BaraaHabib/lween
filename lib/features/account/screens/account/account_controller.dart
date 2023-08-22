


import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/extensions.dart';
import 'package:lween/core/features/entities/shared/lite_entity.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/services/app_image_picker.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_drop_down.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/models/profile_entity.dart';
import 'package:lween/features/account/params/edit_profile_params.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';
import 'package:url_launcher/url_launcher.dart';
class AccountController extends Controller {
  AccountController(this.profile);

  ProfileEntity profile;


  void listener(BuildContext context, AccountState state) {
    if (state is GetProfileLoaded) {
      profile = state.profile;
      NavigationService
          .of(context)
          .pop();
    }
  }

  bool listenWhen(AccountState previous, AccountState current) {
    return current is GetProfileLoading;
  }

  bool buildWhen(AccountState previous, AccountState current) {
    return current is GetProfileLoading;
  }

  void goToMyOrders(BuildContext context) {
    AutoTabsRouter.of(context).navigate(const MyOrdersStackRoute());
  }

  goToActiveOrders(BuildContext context) {
    NavigationService.of(context).navigateTo(
        MyOrdersScreenRoute(notCompletedYet: true,));
  }

  goToFavoriteCompanies(BuildContext context) {
    NavigationService.of(context).navigateTo(
        CompaniesScreenRoute(isFollowed: true,));
  }

  openAccountSettings(BuildContext context) {
    NavigationService
        .of(context)
        .navigateTo(const AccountSettingsScreenRoute(),);
  }

  openSupport(BuildContext context) async {
    final supportUrl = AppStateModel.of(context).initAppEntity.appSupportLink;
    if(supportUrl != null) {
      final Uri supportUri = Uri.parse(supportUrl);
      await launchUrl(supportUri,mode: LaunchMode.externalNonBrowserApplication,);
    }
  }


  @override
  void init() {
    super.init();
    if (sl<AppStateModel>().countries.isNotEmpty) {
      selectedCountry = countriesData.firstOrNull;
      final cityData =  sl<AppStateModel>().cities(selectedCountry?.id).firstOrNull;
      if(cityData != null){
        selectedCity = DropdownItemDataModel(name: cityData.name!, id: cityData.id!);
      }
    }  }

  //#region update profile
  final formKey = GlobalKey<FormBuilderState>();
  DropdownItemDataModel? selectedCity;

  final ValueNotifier<
      DropdownItemDataModel?> selectedCountryNotifier = ValueNotifier<
      DropdownItemDataModel?>(null);

  set selectedCountry(DropdownItemDataModel? value) {
    selectedCountryNotifier.value = value;
  }

  DropdownItemDataModel? get selectedCountry => selectedCountryNotifier.value;

  List<DropdownItemDataModel>? get countryCities =>
      sl<AppStateModel>()
          .cities(selectedCountry?.id,).map((e) =>
          DropdownItemDataModel(
            name: e.name ?? '',
            id: e.id!,
          ),)
          .toList();



  String? validateDropDownCountry(DropdownItemDataModel? value) {
    if (selectedCountry == null) {
      return S.current.pleaseSelectCountry;
    }
    return null;
  }

  List<DropdownItemDataModel> countriesData = sl<AppStateModel>()
      .countries.map((e) =>
      DropdownItemDataModel(
        name: e.name ?? '',
        id: e.id!,
      ),)
      .toList();

  save(BuildContext context) {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
      AccountBloc.instance.add(UpdateProfileEvent(
        cityId: selectedCity!.id,
        imageUrl: profile.imageUrl,
        name: formKey.currentState?.getRawValue('name'),
        newImagePath: _newImagePath,
      ),);
    }
  }

  editProfile(BuildContext context) {
    NavigationService
        .of(context)
        .navigateTo(const UpdateProfileScreenRoute());
  }

  bool updateProfileBuildWhen(AccountState previous, AccountState current) {
    return current is UpdateProfileState;
  }

  void updateProfileListener(BuildContext context, AccountState state) {
    if (state is UpdateProfileLoaded) {
      AccountBloc.instance.add(const GetProfileEvent());
      if(state.newImageRemoteUrl != null){
        profile.imageUrl = state.newImageRemoteUrl;
      }
      newImagePath = null;
      AppToast(S.of(context).informationUpdatedSuccessfully).show();
    }
    else if (state is UpdateProfileError) {
      AppToast(state.message ?? '').show();
    }
  //#endregion
  }

  //#region select image
  String? _newImagePath;
  String? get newImagePath => _newImagePath;
  set newImagePath(String? newImagePath){
    _newImagePath = newImagePath;
    if(_newImagePath != null){
      isImageSelected.value = true;
    }
    else{
      isImageSelected.value = false;
    }
  }

  resetSelectedImage() {
    newImagePath = null;
  }

  ValueNotifier<bool> isImageSelected = ValueNotifier<bool>(false,);

  changeProfileImage(BuildContext context) async {
    newImagePath = await AppImagePicker.pickImage(context);
  }
  //#endregion

}