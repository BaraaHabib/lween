import 'package:flutter/material.dart';

class AnimatedToggle extends StatelessWidget {
  const AnimatedToggle( {
    required this.value,
    required this.child,
    this.keyId,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final dynamic value;
  final dynamic keyId;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: SizedBox(
        key: ValueKey('${this.hashCode}$keyId$value'),
        child: child,
      ),
    );
  }
}