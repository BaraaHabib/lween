

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/generated/l10n.dart';

class OrderItem extends HookWidget {
  const OrderItem({
    required this.item,
    required this.onTap,
    super.key,
  });

  final OrderEntity item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        splashColor: context.theme.primaryColor.withOpacity(0.7),
        borderRadius: Styles.borderRadius14px,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 13.hx, horizontal: 18.wx),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.ticketIconSVG),
                  5.hSpace,
                  AppTextWidget('#',
                    style: context
                        .textTheme
                        .headlineLarge?.copyWith(
                      color: Styles.tripsCountTextColor,
                      height: 0.5,
                    ),
                  ),
                  AppTextWidget(
                    item.orderNumber ?? ' ',
                    style: context
                        .textTheme
                        .headlineLarge?.copyWith(
                        color: Styles.tripsCountTextColor,
                        height: 0.5,
                    ),
                  ),

                ],
              ),
              10.vSpace,
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: AppTextWidget(S
                        .of(context)
                        .company, style: context.textTheme.labelMedium),
                  ),
                  Expanded(
                    flex: 6,
                    child: FittedBox(
                      child: AppTextWidget(item.transportationCompany?.text ?? '',
                        style: context.textTheme.displaySmall, maxLines: 2,),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: AppTextWidget(S
                        .of(context)
                        .from, style: context.textTheme.labelMedium),
                  ),
                  Expanded(
                    flex: 7,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: AppTextWidget(item.fromCity?.text ?? '',
                          style: context.textTheme.displaySmall,
                          maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: AppTextWidget(S
                        .of(context)
                        .seatsCount, style: context.textTheme.labelMedium),
                  ),
                  // 3.hSpace,
                  Expanded(
                    flex: 6,
                    child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: AppTextWidget('${item.seatsCount ?? 0}',
                            style: context.textTheme.displaySmall)),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: AppTextWidget(S
                        .of(context)
                        .to,
                        textAlign: TextAlign.start,
                        style: context.textTheme.labelMedium),
                  ),
                  Expanded(
                    flex: 7,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: AppTextWidget(item.toCity?.text ?? '',
                        maxLines: 2,
                        style: context.textTheme.displaySmall,),
                    ),
                  ),
                ],
              ),
              14.vSpace,
              Row(
                children: [
                  Flexible(
                    child: AppTextWidget(S.of(context).travelDate, style: context.textTheme.labelMedium),
                  ),
                  3.hSpace,
                  Flexible(
                    child: AppTextWidget(item.formattedTravelTimeDate,
                      style: context.textTheme.displaySmall, maxLines: 2,),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
