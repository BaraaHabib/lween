import 'package:auto_route/annotations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/generated/l10n.dart';

@RoutePage()
class RegisterScreen extends HookWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: S.of(context).signup,
        child: const Column(
          children: [

          ],
        ),
    );
  }
}
