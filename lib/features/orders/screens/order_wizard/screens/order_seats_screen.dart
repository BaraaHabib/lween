

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/animated/animated_toggle.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/bordered_container.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/generated/l10n.dart';

part '../widgets/order_seat/seat_widget.dart';
part '../widgets/order_seat/seats_row_widget.dart';
part '../widgets/order_seat/summery_widget.dart';

@RoutePage()
class OrderSeatsScreen extends HookWidget {
  const OrderSeatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance();


    return Stack(
      children: [
        AppScaffold(
          title: S
              .of(context)
              .chooseSeats,
          child: Stack(
            children: [
              Column(
                children: [
                  15.vSpace,
                  Row(
                    children: [
                      Expanded(
                        child: AppTextWidget(S
                            .of(context)
                            .YouCanViewOrReserveSeats, maxLines: 2,),
                      ),
                      SizedBox(
                        height: 30.hx,
                        child: AppGradientTextButtonWithIcon(
                          content: S
                              .of(context)
                              .previewVehicle,
                          onTap: () => NavigationService
                              .of(context,)
                              .navigateTo(
                              withNavigation: false,
                              OrderPreviewVehicleScreenRoute(images: controller.selectedTravelEntity?.images ?? [])),
                          fontSize: 9.spx,
                          icon: Assets.eyeSVG,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                        ),
                      ),
                    ],
                  ),
                  10.vSpace,
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListView.separated(
                        itemCount: controller.selectedTravelEntity?.seats?.length ?? 0,
                        separatorBuilder: (ctx, index) => 5.vSpace,
                        itemBuilder: (ctx, index) =>
                            SeatsRow(
                              seats: controller.selectedTravelEntity?.seats?[index] ?? [],
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 0,
          right: 0,
          child: OrderSummeryWidget(),
        ),
      ],
    );
  }
}


