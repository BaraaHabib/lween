import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/numbers_ext.dart';

class ShadowedWidget extends StatelessWidget {
  const ShadowedWidget({
    required this.child,
    this.offset,
    this.color,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Offset? offset;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: offset ?? Offset(1.wx, 2.hx),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              child: Opacity(
                opacity: 0.5,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      color ?? Styles.colorPrimary, BlendMode.srcATop),
                  child: child,
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    );
    return Container(
      decoration: BoxDecoration(
          // color: Colors.red,

          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 2),
                spreadRadius: 1.rx,
                color: const Color.fromARGB(64, 00, 0, 0),
                blurRadius: 20,
                blurStyle: BlurStyle.outer),
          ]),
      child: child,
    );
  }
}
