

import 'package:flutter/material.dart';
import 'package:lween/core/app_state/appstate.dart';

class InStoreWidget extends StatelessWidget {
  /// widget that hides its child when app is in review in store
  const InStoreWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppStateModel
        .of(context)
        .initAppEntity
        .inStoreReview! ? const SizedBox.shrink() : child;
  }
}
