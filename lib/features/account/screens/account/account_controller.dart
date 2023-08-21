


import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/models/profile_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountController extends Controller {
  AccountController(this.profile);

  ProfileEntity profile;

  void listener(BuildContext context, AccountState state) {
    if (state is GetProfileLoaded) {
      profile = state.profile;
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
}