

import 'package:auto_route/annotations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/features/orders/screens/order_wizard/screens/order_from_to_screen.dart';
import 'package:lween/generated/l10n.dart';

part '../widgets/order_person_info/voucher_widget.dart';

@RoutePage()
class OrderPersonInfoScreen extends HookWidget {
  const OrderPersonInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.get();
    useEffect(() {
      controller.initPassengersNames();
      return () {};
    },
      const [],);
    return AppScaffold(
      title: S
          .of(context)
          .passsengersInfo,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            5.vSpace,
            Row(
              children: [
                Expanded(
                  child: AppTextWidget(S.of(context).enterFullNameForSeats, maxLines: 2,),
                ),
              ],
            ),
            10.vSpace,
            SizedBox(
              height: 0.65.sh,
              child: FormBuilder(
                key: controller.passengersInfoFormKey,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: (controller.orderBody.seats?.length ?? 0),
                  separatorBuilder: (ctx, index) => 20.vSpace,
                  itemBuilder: (ctx, index){
                    final seat = controller
                        .orderBody
                        .seats?.elementAt(index);
                    return LabelWithField(
                      prefix: '#',
                      label:seat?.seatNumber.toString() ?? '',
                      labelColor: Styles.tripsCountTextColor,
                      labelPadding: const EdgeInsetsDirectional.only(start: 10,),
                      child: AppTextField(
                        name: seat?.seatNumber.toString() ?? '',
                        prefixIcon: SvgPicture.asset(Assets.profileIcon,),
                        controller: controller.passengerNamesMap[seat?.seatNumber],
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
            // 15.vSpace,
            Hero(
              tag: 'order-next',
              child: AppGradientTextButton(
                gradientType: AppTextButtonGradientType.secondary,
                content: S.current.next,
                onTap: () => controller.goToPayment(context),
              ),
            ),
            context.mediaQueryPadding.bottom.vSpace,
          ],
        ),
      ),
    );
  }
}
