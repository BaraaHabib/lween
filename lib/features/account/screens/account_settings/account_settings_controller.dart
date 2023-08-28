
import 'package:flutter/src/widgets/framework.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/features/account/screens/account_settings/dialogs/change_phone/change_phone.dart';
import 'package:lween/features/account/screens/account_settings/dialogs/delete_account.dart';
import 'package:lween/features/account/screens/dialogs/language_dialog.dart';
import 'package:lween/generated/l10n.dart';

class AccountSettingsController extends Controller{

  showLanguageDialog(context){
    AppDialogs.showGeneralDialog(
      context: context,
      title: S.current.selectPreferredLanguage,
      content: const LanguageDialog(),
    );
  }

  changePassword(BuildContext context) {
    NavigationService
        .of(context)
        .navigateTo(const ChangePasswordScreenRoute(),);
  }

  logOut(BuildContext context) {
    AppDialogs.showYesNoDialog(
        title: S.current.confirmOperation,
        context: context,
        content: S.of(context).areYouSureYouWantToLogOut,
    ).then((isConfirmed) {
      if(isConfirmed is bool && isConfirmed){
        AppStateModel.of(context).logOut();
      }
    });
  }

  deleteAccount(BuildContext context) {
    AppDialogs.showGeneralDialog(
        context: context,
        title: S.current.confirmOperation,
        content: const DeleteAccountDialog(),
    );
  }

  changePhone(BuildContext context) {

    AppDialogs.showGeneralDialog(
      context: context,
      title: S
          .of(context)
          .enterPhoneNumber,
      content: const ChangePhoneDialog(),
      type: DialogType.info,
    );
  }
}