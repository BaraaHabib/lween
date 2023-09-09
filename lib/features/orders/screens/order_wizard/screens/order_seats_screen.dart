

import 'dart:async';
import 'dart:ffi';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/animated/animated_toggle.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/bordered_container.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/orders/params/available_seats_params.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/generated/l10n.dart';

part '../widgets/order_seat/seat_widget.dart';
part '../widgets/order_seat/seats_row_widget.dart';
part '../widgets/order_seat/summery_widget.dart';

@RoutePage()
class OrderSeatsScreen extends HookWidget {
  const OrderSeatsScreen({this.travelEntity,super.key,});

  /// this will have value when we want to start order from this screen
  final TravelEntity? travelEntity;

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller;
    if(travelEntity != null){
      controller = Controller.getInstance(instance: OrderWizardController(travelEntity: travelEntity),);
      useEffect(() {
        controller.selectedDate = DateTime.now();
        controller.selectTravel(travelEntity);
        return (){};
      },
        const [],
      );
    }else{
      controller = Controller.getInstance();
    }

    final seats = useState(controller.selectedTravelEntity?.seats);

    Timer timer;
    useEffect(() {
      timer = Timer.periodic(15.seconds, (timer) {
        /// app is in foreground and order has not been submitted yet
        if(controller.orderEntity == null &&
            AppStateModel.appLifecycleState == AppLifecycleState.resumed
        ) {
          OrdersBloc.instance.add(
            RefreshAvailableSeatsEvent(params: AvailableSeatsParams(
              dailyTravelId: controller.selectedTravelEntity!.id!,
              travelDate: controller.selectedDate!,
            ),
            )
        );
        }
      });
     return () => timer.cancel();
    },
        const [],
    );

    return BlocConsumer<OrdersBloc, OrdersState>(
      bloc: OrdersBloc.instance,
      buildWhen: (ps, cs) {
        return
          cs is RefreshAvailableSeatsLoaded
              &&
              AvailableSeatsEntity(seats: seats.value) != cs.seatsData
        ;
      },
      listenWhen: (ps, cs) => cs is RefreshAvailableSeatsLoaded,
      listener: (ctx, cs){
        if(cs is RefreshAvailableSeatsLoaded && controller.orderEntity == null){
          if(AvailableSeatsEntity(seats: seats.value) != cs.seatsData){
            AppToast(S.of(context).availableSeatsHasChanged).show();
            
            /// update selected travel seats in controller
            controller.selectedTravelEntity?.seats = cs.seatsData.seats;
            
            /// update seats screen UI
            seats.value = cs.seatsData.seats;
            
            /// get all unavailable seats
            final allUnAvailableSeats = controller.selectedTravelEntity?.
            seatsMatrix.where((e) => !(e.$3.isAvailable ?? true)) ?? [];
            
            /// if selected seat has become unavailable, deselect it
            for( var(_ ,_ ,seat) in allUnAvailableSeats){
              if(controller.isSeatSelected(seat.number ?? 0)) {
                controller.unSelectSeat(seat.number ?? 0);
              }
            }
          }
        }
      },
      builder:(ctx, state) => Stack(
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
                        if(controller.selectedTravelEntity?.images?.isNotEmpty ?? false)
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
                                OrderPreviewVehicleScreenRoute(
                                    images: controller.selectedTravelEntity?.images ?? [],
                                )),
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
                          itemCount: seats.value?.length ?? 0,
                          separatorBuilder: (ctx, index) => 5.vSpace,
                          itemBuilder: (ctx, index) =>
                              SeatsRow(
                                seats: seats.value?[index] ?? [],
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
            child: const OrderSummeryWidget(),
          ),
        ],
      ),
    );
  }
}


