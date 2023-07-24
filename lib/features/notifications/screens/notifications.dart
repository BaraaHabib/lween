

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/features/notifications/screens/controller.dart';
import 'package:lween/features/tickets/screens/controller.dart';
import 'package:lween/generated/l10n.dart';

@RoutePage()
class NotificationsScreen extends HookWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationsController controller = Controller.get(instance: NotificationsController(),permanent: true,);
    return AppScaffold(
        title: S.of(context).notifications,
        child: const Text('Notifications'),
    );
  }
}
