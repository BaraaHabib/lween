

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/extended/get_utils/src/extensions/export.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Home',
      child: Center(
        child: AppGradientTextButton(
          content: 'Log out',
          onTap: () => Provider.of<AppStateModel>(context,listen: false,)
          .logOut(),
        ),
      ),
    );
  }
}
