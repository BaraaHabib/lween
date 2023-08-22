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
  const LogInLoaded({required this.logInEntity});
  final AuthenticateEntity logInEntity;

  @override
  List<Object> get props => [logInEntity!];
}

class LogInError extends LogInState {
  final int? code;
  final int? accountId;

  const LogInError(String message, this.code,this.accountId,) : super(message: message);

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
  final AuthenticateEntity verifyAccountEntity;

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

class ResendCodeLoaded extends ResendCodeState {
  const ResendCodeLoaded();

  @override
  List<Object> get props => [];
}
//#endregion

//#region CheckCode
abstract class CheckCodeState extends AccountState {
  const CheckCodeState({String? message}) : super(message: message);
}

class CheckCodeLoading extends CheckCodeState {
  @override
  List<Object?> get props => [];
}

class CheckCodeLoaded extends CheckCodeState {
  const CheckCodeLoaded();

  @override
  List<Object> get props => [];
}

class CheckCodeError extends CheckCodeState {
  const CheckCodeError(String message) : super(message: message);

  @override
  List<Object?> get props => [message];
}
//#endregion

//#region Update profile
abstract class UpdateProfileState extends AccountState {
  const UpdateProfileState({String? message}) : super(message: message);
}

class UpdateProfileLoading extends UpdateProfileState {
  @override
  List<Object?> get props => [];
}

class UpdateProfileLoaded extends UpdateProfileState {
  const UpdateProfileLoaded({this.newImageRemoteUrl});
  final String? newImageRemoteUrl;
  @override
  List<Object> get props => [];
}

class UpdateProfileError extends UpdateProfileState {
  const UpdateProfileError(String message) : super(message: message);

  @override
  List<Object?> get props => [message];
}
//#endregion

//#region enter forgot password
abstract class EnterForgotPasswordState extends AccountState {
  const EnterForgotPasswordState({String? message}) : super(message: message);
}

class EnterForgotPasswordLoading extends EnterForgotPasswordState {
  @override
  List<Object?> get props => [];
}

class EnterForgotPasswordLoaded extends EnterForgotPasswordState {
  const EnterForgotPasswordLoaded();

  @override
  List<Object> get props => [];
}

class EnterForgotPasswordError extends EnterForgotPasswordState {
  const EnterForgotPasswordError(String message) : super(message: message);

  @override
  List<Object?> get props => [message];
}
//#endregion

//#region get account
abstract class GetProfileState extends AccountState {
  const GetProfileState({String? message}) : super(message: message);
}

class GetProfileLoading extends GetProfileState {
  @override
  List<Object?> get props => [];
}

class GetProfileLoaded extends GetProfileState {
  const GetProfileLoaded(this.profile,);

  final ProfileEntity profile;

  @override
  List<Object> get props => [profile,];
}

class GetProfileError extends GetProfileState {
  const GetProfileError(String message) : super(message: message);

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

abstract class ForgetPasswordState extends AccountState {
  const ForgetPasswordState({String? message}) : super(message: message);
}

class ForgetPasswordLoading extends ForgetPasswordState {
  @override
  List<Object?> get props => [];
}

class ForgetPasswordLoaded extends ForgetPasswordState {
  const ForgetPasswordLoaded(
      // {this.forgetPasswordEntity}
      );
  // final ForgetPasswordEntity? forgetPasswordEntity;

  @override
  List<Object> get props => [];
}

class ForgetPasswordError extends ForgetPasswordState {
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
