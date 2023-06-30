part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
}

class LogInEvent extends AccountEvent {
  const LogInEvent({
    required this.input,
    required this.password,
  });

  final String? input;
  final String? password;

  @override
  List<Object?> get props => [input, password];
}

class VerifyAccountEvent extends AccountEvent {
  const VerifyAccountEvent({
    required this.patientId,
    required this.verificationCode,
    required this.password,
  });

  final int patientId;
  final String verificationCode;
  final String password;

  @override
  List<Object?> get props => [patientId, verificationCode, password];
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
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

class InitAppEvent extends AccountEvent {
  const InitAppEvent();

  @override
  List<Object?> get props => [];
}

class ForgetPasswordEvent extends AccountEvent {
  const ForgetPasswordEvent({this.forgetPasswordParams});
  final ForgetPasswordParams? forgetPasswordParams;

  @override
  List<Object?> get props => [forgetPasswordParams];
}

class ChangePasswordEvent extends AccountEvent {
  const ChangePasswordEvent(this.params);

  final ChangePasswordParams params;

  @override
  List<Object?> get props => [params];
}
