part of '../../screens/order_person_info_screen.dart';


class CouponWidget extends HookWidget{
  const CouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance();

    final selectedPaymentMethod = useValueListenable(controller.selectedPaymentMethod);
    return BlocConsumer<OrdersBloc,OrdersState>(
      bloc: OrdersBloc.instance,
      listener: controller.couponListener,
      listenWhen: controller.couponListenWhen,
      buildWhen: controller.couponBuildWhen,
      builder: (context,state) {
        num newValue = controller.totalPrice;
        String discount = '';
        if (state is CheckCouponLoaded) {
          final v = state.coupon;
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
        return AbsorbPointer(
          absorbing: state is CheckCouponLoading,
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
                        .enterCouponCode, maxLines: 2,),
                  ),
                ],
              ),
              5.vSpace,
              AppTextField(
                name: 'coupon',
                enabled: selectedPaymentMethod != null,
                onChanged: controller.onCouponChanged,
                controller: controller.couponController,
                prefixIcon: SvgPicture.asset(Assets.priceTagSVG,),
                label: S
                    .of(context)
                    .couponCode,
                suffixIcon: _CheckCodeIconWidget(state: state,),
              ),
              SizedBox(
                // color: Colors.red,
                height: 70.hx,
                child: AnimatedToggle(
                  value: state is CheckCouponLoading ,
                  child: Column(
                    children: [
                      if(state is CheckCouponLoaded && controller.discount != 0)
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
          value: state is CheckCouponLoading ,
          child: state is CheckCouponLoading ? Transform.scale(scale:0.7, child: const WaitingWidget()) :
          AppTextButton(
            onPressed: (){
              FocusManager.instance.primaryFocus?.unfocus();
              controller.checkCoupon();
            },
            child: Text(S.of(context).apply),
          ),
        ),
      ),
    );
  }
}

