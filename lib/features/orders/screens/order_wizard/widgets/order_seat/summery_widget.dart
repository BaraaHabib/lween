

part of '../../screens/order_seats_screen.dart';


class OrderSummeryWidget extends HookWidget {
  const OrderSummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.get();
    return ValueListenableBuilder(
      valueListenable: controller.orderBodyNotifier,

      builder: (ctx, value, child) =>
          Container(
            height: 135.hx,
            width: 1.sw,
            padding: EdgeInsets.all(16.rx,),
            decoration: BoxDecoration(
              color: context.theme.cardTheme.color,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        width: 45.rx,
                        height: 45.hx,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: Styles.borderRadius30px,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF8217C9),
                              Color(0xFFA32FD0),
                              Color(0xFFAE34D2),
                            ],
                            begin: AlignmentDirectional.centerStart,
                            end: AlignmentDirectional.centerEnd,
                          ),
                        ),
                        child: SvgPicture.asset(
                          Assets.seatSVG,
                          colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn,),
                        )
                    ),
                    10.hSpace,
                    SizedBox(
                      width: 0.7.sw,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTextWidget(
                                S
                                    .of(context)
                                    .selectedSeats,
                                style: context.textTheme.headlineLarge,
                              ),
                              AppTextWidget(
                                  '${controller.totalPrice} ${AppConfigurations.currency}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: AppTextWidget(
                                  value.seats?.map((e) => e.seatNumber ?? 0).join(', ') ?? '',
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                      color: Styles.textButtonColor
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Hero(
                  tag: 'order-next',
                  child: AppGradientTextButton(
                    gradientType: AppTextButtonGradientType.secondary,
                    content: S.current.next,
                    onTap: () => controller.goToPassengerNames(context),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}