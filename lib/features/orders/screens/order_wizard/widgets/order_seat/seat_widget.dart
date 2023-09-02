part of '../../screens/order_seats_screen.dart';

class SeatWidget extends HookWidget {

  const SeatWidget({required this.seat, super.key,});

  final SeatEntity seat;

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance();
    final isAvailable = seat.isAvailable ?? true;
    final isSelected = useState(controller.isSeatSelected(seat.number ?? 0,));
    Color color = isAvailable ? Styles.availableSeatColor : Styles
        .reservedSeatColor;
    late Widget widget;
    if (isSelected.value) {
      widget = AppImage(
          path: Assets.bookedSeat(context),
          type: ImageType.asset,
          fit: BoxFit.scaleDown,
          width: 23.wx,
          height: 26.hx,
      );
    }
    else {
      widget = AppImage(
        path: Assets.seatSVG,
        type: ImageType.asset,
        color: isAvailable ? null : color,
        fit: BoxFit.scaleDown,
        width: 23.wx,
        height: 26.hx,
      );
    }

    return Card(
      child: InkWell(
        onTap: !isAvailable ? (){
          AppToast(S.of(context).thisSeatIsNotAvailable).show();
        } : () {
          final isSeatSelected = controller.seatPressed(seat.number ?? 0,context,);
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
              child: widget,
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