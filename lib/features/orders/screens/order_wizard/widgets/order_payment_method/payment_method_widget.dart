

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/generated/l10n.dart';
import 'package:screenshot/screenshot.dart';



class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    super.key,
    required this.paymentMethod,
    required this.title,
    this.subtitle,
    required this.icon,
    this.onTap,
    this.disabled = false,

  });

  final PaymentMethod paymentMethod;
  final String title;
  final String? subtitle;
  final String icon;
  final bool disabled;
  final Function(PaymentMethod p,)? onTap;
  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance();
    return IgnorePointer(
      ignoring: disabled,
      child: Card(
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
                  fillColor: disabled ? MaterialStateColor.resolveWith((states) => Styles.liteGrayColor,) : null,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // if(subtitle != null)
                      //   const Text('',),
                      Text(title,
                        style: context
                            .textTheme
                            .labelMedium?.copyWith(
                          color:  disabled ? Styles.liteGrayColor: null,
                        ),),
                      if(subtitle != null)
                        ...[
                          5.vSpace,
                          Row(
                          children: [
                            Expanded(
                              child: Text(
                                subtitle!,
                                maxLines: 2,
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: Styles.colorOrange,
                                ),
                              ),
                            ),
                          ],
                        )],
                    ],
                  ),
                ),
                // const Spacer(),
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
      ),
    );
  }
}
