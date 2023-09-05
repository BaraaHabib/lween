

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/lween/widgets/mini_vehicle_widget.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/bordered_container.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/features/orders/screens/order_wizard/widgets/order_travels/vehicles_widget.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/generated/l10n.dart';

part '../widgets/order_travels/company_card_widget.dart';
@RoutePage()
class OrderTravelsScreen extends HookWidget {
  const OrderTravelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance();
    final currentType = useState<VehicleType?>(null);

    return AppScaffold(
      title: S.current.bookATrip,
      child: Column(
        children: [
          20.vSpace,
          CompanyCardWidget(
            companyEntity: controller.selectedCompanyEntity!,
            from: controller.selectedFromCity?.name ?? '',
            to: controller.selectedToCity?.name ?? '',
            date: controller.selectedDate ?? DateTime.now(),
          ),
          23.vSpace,
          Row(
            children: [
              AppTextWidget(S
                  .of(context)
                  .availableDateTravels,
              )
            ],
          ),
          16.vSpace,
          Expanded(
            child: Row(
              children: [
                if(controller.availableVehiclesTypes.length > 1)
                  ...[
                    Expanded(
                      flex: 3,
                      child: VehiclesTypeWidget(
                        types: controller.availableVehiclesTypes,
                        currentType: currentType.value,
                        onTap: (t) {
                          if (currentType.value == t) {
                            currentType.value = null;
                          }
                          else {
                            currentType.value = t;
                          }
                        },
                      ),
                    ),
                    5.hSpace,
                  ],
                Expanded(
                  flex: 20,
                  child: ListView.separated(
                    itemCount: controller
                        .travelsResultByVehicleType(currentType.value)
                        .length,
                    separatorBuilder: (ctx, index) => 18.vSpace,
                    itemBuilder: (ctx, index) {
                      final item = controller.travelsResultByVehicleType(
                          currentType.value)[index];
                      return GestureDetector(
                        onTap: () {
                          controller.selectTripAndGoToSeats(context, item,);
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8,),
                            child: Row(
                              children: [
                                AppImage(
                                  path: Assets.tripClockPNG(context,),
                                  type: ImageType.asset,
                                  height: 50.rx,
                                  width: 50.rx,
                                ),
                                8.hSpace,
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      AppTextWidget(item.travelTime ?? '',
                                          style: context.textTheme.titleMedium),
                                      5.vSpace,
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minHeight: 15.hx,
                                          maxHeight: 50.hx,
                                        ),
                                        // width: 220.wx,
                                        child: Wrap(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          // spacing: 5,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Transform.scale(
                                                  scale: 0.7,
                                                  child: SvgPicture.asset(
                                                    Assets.locationIcon,
                                                    colorFilter: const ColorFilter
                                                        .mode(
                                                      Styles.headLineFontColor,
                                                      BlendMode.srcIn,),
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                                3.hSpace,
                                                AppTextWidget(item.fromToText,
                                                  style: context.textTheme
                                                      .headlineSmall,),
                                              ],
                                            ),
                                            // const Spacer(),
                                            MiniVehicleWidget(
                                              travelMethodEnum: item
                                                  .travelMethodEnum,
                                              travelMethodText: item
                                                  .travelMethodText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}