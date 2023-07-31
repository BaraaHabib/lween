part of '../../screens/order_seats_screen.dart';

class SeatWidget extends HookWidget {

  const SeatWidget({required this.seat, super.key,});

  final SeatEntity seat;

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.get();
    final isAvailable = seat.isAvailable ?? true;
    final isSelected = useState(controller.isSeatSelected(seat.number ?? 0,));
    Color color = isAvailable ? Styles.availableSeatColor : Styles
        .reservedSeatColor;
    late Widget widget;
    if (isSelected.value) {
      widget = AppImage(
        path: Assets.bookedSeat(context),
        type: ImageType.asset,
      );
    }
    else {
      widget = SvgPicture.asset(
        Assets.seatSVG,
        colorFilter: isAvailable ? null : ColorFilter.mode(color,
          BlendMode.srcIn,),
      );
    }

    return Card(
      child: InkWell(
        onTap: !isAvailable ? null : () {
          final isSeatSelected = controller.seatPressed(seat.number ?? 0);
          isSelected.value = isSeatSelected;
        },
        splashColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Spacer(),
            10.vSpace,
            AnimatedToggle(
              value: isSelected.value,
              keyId: seat.number,
              child: Transform.scale(
                scale: 1.2,
                child: widget,
              ),
            ),
            5.vSpace,
            AppTextWidget(
              seat.number?.toString() ?? '',
              style: TextStyle(color: color, fontSize: 12.spx),
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}