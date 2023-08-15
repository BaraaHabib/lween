
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/features/auth/screens/dialogs/language_dialog.dart';
import 'package:lween/generated/l10n.dart';

class AccountController extends Controller{

  showLanguageDialog(context){
    AppDialogs.showGeneralDialog(
      context: context,
      title: S.current.selectPreferredLanguage,
      content: const LanguageDialog(),
    );
  }
}