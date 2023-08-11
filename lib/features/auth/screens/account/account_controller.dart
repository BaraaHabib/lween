
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/features/auth/screens/dialogs/language.dart';

class AccountController extends Controller{

  showLanguageDialog(context){
    AppDialogs.showGeneralDialog(
      context: context,
      content: const LanguageDialog(),
    );
  }
}