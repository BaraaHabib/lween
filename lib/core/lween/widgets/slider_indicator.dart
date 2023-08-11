

import 'package:flutter/material.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/animated/animated_toggle.dart';
import 'package:lween/core/widgets/bordered_container.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator(
      {super.key, required this.selectedIndex, required this.count});

  final int selectedIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count, (index) =>
          AnimatedToggle(
            value: index == selectedIndex,
            child: BorderedContainer(
              height: 10.rx,
              width: 10.rx,
              margin: const EdgeInsetsDirectional.only(start: 7,),
              color: index == selectedIndex
                  ? const Color(0xFFF2F8FC,)
                  : const Color(0xFFF2F8FC,).withOpacity(0.5),
              child: const SizedBox(),
            ),
          ),
      ),
    );
  }
}
