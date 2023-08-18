part of '../../screens/order_person_info_screen.dart';


class VoucherWidget extends HookWidget{
  const VoucherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance();

    final selectedPaymentMethod = useValueListenable(controller.selectedPaymentMethod);
    return BlocConsumer<OrdersBloc,OrdersState>(
      bloc: OrdersBloc.instance,
      listener: controller.voucherListener,
      listenWhen: controller.voucherListenWhen,
      buildWhen: controller.voucherBuildWhen,
      builder: (context,state) {
        num newValue = controller.totalPrice;
        String discount = '';
        if (state is CheckVoucherLoaded) {
          final v = state.voucher;
          if (v.percentage != 0 && v.percentage != null) {
            newValue = newValue - (v.percentage! / 100) * newValue;
            discount = '${v.percentage} %';
          } else if (v.value != null && v.value != 0) {
            newValue = newValue - v.value!;
            discount = '${v.value} ${AppConfigurations.currency}';
          } else {
            newValue = controller.totalPrice;
          }
        }
        return IgnorePointer(
          ignoring: state is CheckVoucherLoading,
          child: Column(
            children: [
              // 2.vSpace,
              const Divider(),
              4.vSpace,
              Row(
                children: [
                  Expanded(
                    child: AppTextWidget(S
                        .of(context)
                        .enterVoucherCode, maxLines: 2,),
                  ),
                ],
              ),
              5.vSpace,
              AppTextField(
                name: 'voucher',
                enabled: selectedPaymentMethod != null,
                onChanged: controller.onVoucherChanged,
                controller: controller.voucherController,
                prefixIcon: SvgPicture.asset(Assets.priceTagSVG,),
                label: S
                    .of(context)
                    .voucherCode,
                suffixIcon: _CheckCodeIconWidget(state: state,),
              ),
              SizedBox(
                // color: Colors.red,
                height: 70.hx,
                child: AnimatedToggle(
                  value: state is CheckVoucherLoading ,
                  child: Column(
                    children: [
                      if(state is CheckVoucherLoaded && controller.discount != 0)
                        ...[
                          8.vSpace,
                          Row(
                            children: [
                              AppTextWidget(
                                S.of(context).youHaveDiscount(
                                    discount.toString()),
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: Styles.greenColor,

                                ),
                              )
                            ],
                          ),
                          8.vSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTextWidget(
                                S.of(context).newRequiredPayment,
                                    style: context.textTheme.headlineLarge,
                              ),
                              AppTextWidget(
                                '$newValue ${AppConfigurations.currency}',
                                    style: context.textTheme.headlineLarge?.copyWith(
                                      color: Styles.blueColor,
                                    ),
                              ),
                            ],
                          ),
                        ]
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}


class _CheckCodeIconWidget extends StatelessWidget {
  const _CheckCodeIconWidget({
    required this.state,
    super.key,
  });
  
  final OrdersState state;
  
  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance();
    return SizedBox.square(
      dimension: 50.rx,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: AnimatedToggle(
          value: state is CheckVoucherLoading ,
          child: state is CheckVoucherLoading ? Transform.scale(scale:0.7, child: const WaitingWidget()) :
          AppTextButton(
            onPressed: (){
              FocusManager.instance.primaryFocus?.unfocus();
              controller.checkVoucher();
            },
            child: Text(S.of(context).apply),
          ),
        ),
      ),
    );
  }
}

