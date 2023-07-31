part of '../../screens/order_person_info_screen.dart';


class VoucherWidget extends HookWidget{
  const VoucherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.get();

    return Column(
      children: [
        // 2.vSpace,
        const Divider(),
        4.vSpace,
        Row(
          children: [
            Expanded(
              child: AppTextWidget(S.of(context).enterVoucherCode, maxLines: 2,),
            ),
          ],
        ),
        10.vSpace,
        AppTextField(
          name: 'voucher',
          onChanged: controller.onVoucherChanged,
          prefixIcon: SvgPicture.asset(Assets.priceTagSVG,),
          label: S.of(context).voucherCode,
          suffixIcon: IconButton(
            onPressed: (){

            },
            icon: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
