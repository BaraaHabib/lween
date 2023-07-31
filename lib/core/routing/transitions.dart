part of 'app_router.dart';


Widget customSlideIn(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  late Offset offset1;
  late Offset offset2;
  if (Lween.locale.isLTR) {
    offset1 = const Offset(-1.0, 0.0);
    offset2 = const Offset(0.1, 0.0);
  } else {
    offset1 = const Offset(1.0, 0.0);
    offset2 = const Offset(-0.1, 0.0);
  }
  return SlideTransition(
    position: TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: offset1,
          end: offset2,
        ),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: offset2,
          end: Offset.zero,
        ),
        weight: 1,
      ),
    ]).animate(animation),
    child: child,
  );
}
