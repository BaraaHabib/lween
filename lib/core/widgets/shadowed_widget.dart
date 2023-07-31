import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/numbers_ext.dart';

class ShadowedWidget extends StatelessWidget {
  const ShadowedWidget({
    required this.child,
    this.offset,
    this.color =  const Color.fromARGB(75,157,178,191,),
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
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              child: Opacity(
                opacity: 0.9,
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
  }
}
