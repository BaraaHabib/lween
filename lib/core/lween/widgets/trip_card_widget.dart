

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/extended/string_ext.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/generated/l10n.dart';

enum TripCardType{
  previous,
  future
}

class TripCard extends HookWidget {
  const TripCard({
    required this.to,
    required this.from,
    required this.date,
    required this.subtitle,
    this.type = TripCardType.previous,
    this.imageUrl,
    super.key,
  });

  final String? imageUrl;
  final String from;
  final String to;
  final String subtitle;
  final String date;
  final TripCardType type;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.wx,vertical: 5.hx,),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50,)),
              child: AppImage(
                width: 60.rx,
                height: 60.rx,
                type: (imageUrl?.isAssets ?? true)  ?   ImageType.asset : ImageType.cachedNetwork,
                path: imageUrl ?? Assets.ticketIconSVG ,
              ),
            ),
            15.hSpace,
            Expanded(
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextWidget(
                          '$from - $to',
                          style: context.theme.textTheme
                              .titleSmall?.copyWith(fontWeight: FontWeight.w600,),
                          maxLines: 2,
                        ),
                      ),
                      // const Spacer(),
                      if(isPreviousTripWidget)
                        ...[
                          Transform.scale(
                            scale: 0.9,
                            child: Assets.orderDateIconWidget,
                          ),
                          2.hSpace,
                          AppTextWidget(
                            date,
                            style: context.theme.textTheme.headlineSmall?.copyWith(
                              height: 1.1,
                            ),
                          ),
                        ],
                    ],
                  ),
                  5.vSpace,
                  Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: isPreviousTripWidget ? 0.7 : 1,
                        child: isPreviousTripWidget ? Assets.locationIconWidget : Assets.orderDateIconWidget,
                      ),
                      3.hSpace,
                      AppTextWidget(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: context.theme.textTheme.headlineSmall?.copyWith(
                          height: 2,
                        ),
                      ),
                      if(!isPreviousTripWidget)
                        AppTextWidget(
                          '($date)',
                          style: context.theme.textTheme.headlineSmall?.copyWith(
                            height: 1,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get isPreviousTripWidget => type == TripCardType.previous;
}
