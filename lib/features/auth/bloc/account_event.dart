part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
}

class LogInEvent extends AccountEvent {
  const LogInEvent({
    required this.params,
  });

  final LogInParams params;

  @override
  List<Object?> get props => [params,];
}

class VerifyAccountEvent extends AccountEvent {
  const VerifyAccountEvent({
    required this.params,
  });

  final VerifyAccountParams params;
  @override
  List<Object?> get props => [params,];
}

class CheckCodeEvent extends AccountEvent {
  const CheckCodeEvent({
    required this.params,
  });

  final CheckCodeParams params;
  @override
  List<Object?> get props => [params,];
}

class RegisterEvent extends AccountEvent {
  const RegisterEvent(
    this.params,
  );

  final RegisterParams params;

  @override
  List<Object?> get props => params.props;
}

class ResendCodeEvent extends AccountEvent {
  const ResendCodeEvent({
    required this.params,
  });

  final ResendCodeParams params;

  @override
  List<Object?> get props => [params];
}

class InitAppEvent extends AccountEvent {
  const InitAppEvent();

  @override
  List<Object?> get props => [];
}

class ForgetPasswordEvent extends AccountEvent {
  const ForgetPasswordEvent({required this.params});
  final ForgetPasswordParams params;

  @override
  List<Object?> get props => [params];
}
class EnterForgotPasswordEvent extends AccountEvent {
  const EnterForgotPasswordEvent({required this.params});
  final EnterForgotPasswordParams params;

  @override
  List<Object?> get props => [params];
}

class ChangePasswordEvent extends AccountEvent {
  const ChangePasswordEvent(this.params);

  final ChangePasswordParams params;

  @override
  List<Object?> get props => [params];
}
