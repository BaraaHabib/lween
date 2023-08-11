part of '../../screens/order_seats_screen.dart';


class SeatsRow extends StatelessWidget {
  const SeatsRow({
    required this.seats,
    super.key});

  final List<SeatEntity> seats;

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance();
    return Wrap(
      children: seats.map((e) {
        return SizedBox.square(
          dimension: controller.seatDimension,
          child: e.isDivider ? const SizedBox() : SeatWidget(seat: e),
        );
      }
      ).toList(),
    );
  }
}
