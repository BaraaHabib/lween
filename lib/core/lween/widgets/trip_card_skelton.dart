
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/shimmer_ui.dart';

class TripCardSkeleton extends StatelessWidget {
  const TripCardSkeleton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 16.wx,vertical: 5.hx,),
      decoration: BoxDecoration(
        border: Border.all(
        ),
        borderRadius: Styles.borderRadius14px,
      ),
      child: Row(
        children: [
          ShimmerUI.circle(60.rx),
          15.hSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerUI.text(),
                  ],
                ),
                // Spacer(),
                5.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ShimmerUI.text(w: 180.wx,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
