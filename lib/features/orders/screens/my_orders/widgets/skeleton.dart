

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/shimmer_ui.dart';

class OrderItemSkeleton extends StatelessWidget {
  const OrderItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.hx, horizontal: 18.wx),
      decoration: BoxDecoration(
        border: Border.all(),
        // color: Colors.grey.withOpacity(0.5),
        borderRadius: Styles.borderRadius14px,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ShimmerUI.circle(25.rx,),
              5.hSpace,
              ShimmerUI.text(),

            ],
          ),
          12.vSpace,
          Row(
            children: [
              Expanded(
                flex: 12,
                child: ShimmerUI.text(h: 12.hx),

              ),
              const Spacer(),
              Expanded(
                flex: 10,
                child: ShimmerUI.text(h: 12.hx),
              ),
            ],
          ),
          5.vSpace,
          Row(
            children: [
              Expanded(
                flex: 12,
                child: ShimmerUI.text(h: 12.hx),
              ),
              const Spacer(),
              Expanded(
                flex: 10,
                child: ShimmerUI.text(h: 12.hx),
              ),
            ],
          ),
          16.vSpace,
          Row(
            children: [
              Flexible(
                child: ShimmerUI.text(h: 12.hx,w: 50.wx,),
              ),
              3.hSpace,
              Flexible(
                child: ShimmerUI.text(h: 12.hx,w: 65.wx,),
              ),
            ],
          ),
          5.vSpace,

        ],
      ),
    );
  }
}
