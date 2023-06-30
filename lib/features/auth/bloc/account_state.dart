part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState({this.message});
  final String? message;
}

class AccountInitial extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountLoading extends AccountState {
  @override
  List<Object?> get props => [];
}

//#region login
abstract class LogInState extends AccountState {
  const LogInState({String? message}) : super(message: message);
}

class LogInLoading extends LogInState {
  @override
  List<Object?> get props => [];
}

class LogInLoaded extends LogInState {
  const LogInLoaded({this.logInEntity});
  final LogInEntity? logInEntity;

  @override
  List<Object> get props => [logInEntity!];
}

class LogInError extends LogInState {
  const LogInError(String message) : super(message: message);

  @override
  List<Object?> get props => [message];
}
//#endregion login

//#region register
abstract class RegisterState extends AccountState {
  const RegisterState({String? message}) : super(message: message);
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoaded extends RegisterState {
  final RegisterEntity registerEntity;

  const RegisterLoaded(this.registerEntity);

  @override
  List<Object> get props => [];
}

class RegisterError extends RegisterState {
  const RegisterError(String message) : super(message: message);

  @override
  List<Object?> get props => [message];
}
//#endregion

//#region VerifyAccount
abstract class VerifyAccountState extends AccountState {
  const VerifyAccountState({String? message}) : super(message: message);
}

class VerifyAccountLoading extends VerifyAccountState {
  @override
  List<Object?> get props => [];
}

class VerifyAccountLoaded extends VerifyAccountState {
  final VerifyAccountEntity verifyAccountEntity;

  const VerifyAccountLoaded(this.verifyAccountEntity);

  @override
  List<Object> get props => [];
}

class VerifyAccountError extends VerifyAccountState {
  const VerifyAccountError(String message) : super(message: message);

  @override
  List<Object?> get props => [message];
}
//#endregion

//#region resend code
abstract class ResendCodeState extends AccountState {
  const ResendCodeState({String? message}) : super(message: message);
}

class ResendCodeLoading extends ResendCodeState {
  @override
  List<Object?> get props => [];
}


class ResendCodeError extends ResendCodeState {
  const ResendCodeError(String message) : super(message: message);

  @override
  List<Object?> get props => [message];
}
//#endregion

class AccountError extends AccountState {
  const AccountError(String message) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class ChangePasswordLoading extends AccountState {
  @override
  List<Object?> get props => [];
}

class PasswordChangeError extends AccountState {
  const PasswordChangeError(this.errorMessage);

  final String? errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}

class ForgetPasswordLoading extends AccountState {
  @override
  List<Object?> get props => [];
}

class ForgetPasswordLoaded extends AccountState {
  const ForgetPasswordLoaded({this.forgetPasswordEntity});
  final ForgetPasswordEntity? forgetPasswordEntity;

  @override
  List<Object> get props => [forgetPasswordEntity!];
}

class ForgetPasswordError extends AccountState {
  const ForgetPasswordError(String message) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class ResetPasswordLoading extends AccountState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordError extends AccountState {
  const ResetPasswordError(String message) : super(message: message);

  @override
  List<Object?> get props => [message];
}
