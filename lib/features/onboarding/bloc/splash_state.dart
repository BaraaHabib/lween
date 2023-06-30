part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoading extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashError extends SplashState {
  // final Function callBack;
  final String message;

  const SplashError({required this.message});
  @override
  List<Object?> get props => [];
}

class SplashLoaded extends SplashState {
  const SplashLoaded(this.initResult);

  final InitResult initResult;
  @override
  List<Object?> get props => [];
}
