

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/features/auth/screens/account_controller.dart';
import 'package:lween/features/auth/screens/dialogs/language.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

@RoutePage()
class AccountScreen extends HookWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Controller.get(
      instance: AccountController(), permanent: true,);
    return AppScaffold(
      title: S
          .of(context)
          .myAccount,
      withBackButton: false,
      centerTitle: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
              child: AppGradientTextButton(
                onTap: sl<AppStateModel>().logOut,
                  content: 'Log out',
              ),
          ),
          const LanguageDialog(),
        ],
      ),
    );
  }
}



