

import 'package:flutter/material.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';



class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    super.key,
    required this.paymentMethod,
    required this.title,
    required this.icon,
    this.onTap,

  });

  final PaymentMethod paymentMethod;
  final String title;
  final String icon;
  final Function(PaymentMethod p,)? onTap;
  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.get();
    return Card(
      child: InkWell(
        onTap: (){
          onTap?.call(paymentMethod,);
        },
        borderRadius: Styles.borderRadius16px,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Radio(
                value: paymentMethod.paymentProviderEnum,
                groupValue: controller.selectedPaymentMethod.value?.paymentProviderEnum,
                onChanged: (r){
                  onTap?.call(paymentMethod,);
                },
              ),
              Text(title,style: context.textTheme.labelMedium,),
              const Spacer(),
              SizedBox(
                width: 60.wx,
                height: 50.hx,
                child: AppImage(
                  path: icon,
                  type: ImageType.asset,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
