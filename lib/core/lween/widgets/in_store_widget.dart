

import 'package:flutter/material.dart';
import 'package:lween/core/app_state/appstate.dart';

class InStoreWidget extends StatelessWidget {
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
