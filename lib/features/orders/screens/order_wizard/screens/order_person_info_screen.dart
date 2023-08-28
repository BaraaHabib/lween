

import 'package:auto_route/annotations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/animated/animated_toggle.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/core/widgets/waiting_widget.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_from_to_screen.dart';
import 'package:lween/generated/l10n.dart';

part '../widgets/order_payment_method/voucher_widget.dart';

@RoutePage()
class OrderPersonInfoScreen extends HookWidget {
  const OrderPersonInfoScreen({super.key});

  // final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance();
    useEffect(() {
      controller.initPassengersNames();
      final firstSeat = controller.orderBody.seats?.firstOrNull;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (firstSeat != null) {
          controller
              .passengersInfoFormKey
              .currentState
              ?.fields[firstSeat.seatNumber.toString()]?.focus();
        }
      },);
      return () {};
    }, const [],
    );
    return AppScaffold(
      title: S
          .of(context)
          .passsengersInfo,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              5.vSpace,
              Row(
                children: [
                  Expanded(
                    child: AppTextWidget(S
                        .of(context)
                        .enterFullNameForSeats, maxLines: 2,),
                  ),
                ],
              ),
              10.vSpace,
              Expanded(
                child: FormBuilder(
                  key: controller.passengersInfoFormKey,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: (controller.orderBody.seats?.length ?? 0),
                    separatorBuilder: (ctx, index) => 20.vSpace,
                    itemBuilder: (ctx, index) {
                      final seat = controller
                          .orderBody
                          .seats?.elementAt(index);
                      return LabelWithField(
                        prefix: '#',
                        label: seat?.seatNumber.toString() ?? '',
                        labelColor: Styles.tripsCountTextColor,
                        labelPadding: const EdgeInsetsDirectional.only(
                          start: 10,),
                        child: AppTextField(
                          name: seat?.seatNumber.toString() ?? '',
                          prefixIcon: SvgPicture.asset(Assets.profileIcon,),
                          controller: controller.passengerNamesMap[seat
                              ?.seatNumber],
                          label: S.current.fullName,
                          // onChanged: (v) => controller.updatePersonName(v,seat?.seatNumber,),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(5),
                          ]),
                        ),
                      );
                    }
                    ,
                  ),
                ),
              ),
              80.vSpace,
            ],
          ),
          Positioned(
            bottom: 30.hx,
            child: Hero(
              tag: 'order-next',
              child: AppGradientTextButton(
                gradientType: AppTextButtonGradientType.secondary,
                content: S.current.next,
                onTap: () => controller.goToPayment(context),
              ),
            ),),
        ],
      ),
    );
  }
}
