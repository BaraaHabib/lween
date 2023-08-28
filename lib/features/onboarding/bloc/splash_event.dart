part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class SplashInitEvent extends SplashEvent {
  const SplashInitEvent(this.context);

  final BuildContext context;

  @override
  List<Object?> get props => [];
}
