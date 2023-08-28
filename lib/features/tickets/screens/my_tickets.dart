

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/features/tickets/screens/controller.dart';
import 'package:lween/generated/l10n.dart';

@RoutePage()
class MyTicketsScreen extends HookWidget {
  const MyTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyTicketsController controller = Controller.getInstance(instance: MyTicketsController(),permanent: true,);
    return AppScaffold(
        title: S.of(context).myTickets,
        child: const Text('Tickets'),
    );
  }
}
