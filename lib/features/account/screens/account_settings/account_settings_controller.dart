
import 'package:flutter/src/widgets/framework.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
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
    // NavigationService
    //     .of(context)
    //     .navigateTo(const ResetPasswordScreenRoute());
  }
}