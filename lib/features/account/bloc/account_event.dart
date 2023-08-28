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
  const ChangePasswordEvent({required this.currentPassword, required this.newPassword,});

  final String currentPassword;
  final String newPassword;

  @override
  List<Object?> get props => [currentPassword,newPassword,];
}

class GetProfileEvent extends AccountEvent {
  const GetProfileEvent();


  @override
  List<Object?> get props => [];
}

class UpdateProfileEvent extends AccountEvent {
  const UpdateProfileEvent({
    required this.name,
    this.imageUrl,
    this.newImagePath,
    required this.cityId,
  });

  final String name;
  final String? newImagePath;
  final String? imageUrl;
  final int cityId;

  @override
  List<Object?> get props => [name,newImagePath,imageUrl,cityId];
}

class UpdateProfilePictureEvent extends AccountEvent {
  const UpdateProfilePictureEvent(this.path,);

  final String path;

  @override
  List<Object?> get props => [path,];
}
class DeleteAccountEvent extends AccountEvent {
  const DeleteAccountEvent(this.password,);

  final String password;

  @override
  List<Object?> get props => [password,];
}
class RequestChangePhoneEvent extends AccountEvent {
  const RequestChangePhoneEvent(this.newPhoneNumber,);

  final String newPhoneNumber;

  @override
  List<Object?> get props => [newPhoneNumber,];
}
class ConfirmChangePhoneCodeEvent extends AccountEvent {
  const ConfirmChangePhoneCodeEvent({
    required this.password,
    required this.code,
  });

  final String password;
  final String code;

  @override
  List<Object?> get props => [password,code,];
}

