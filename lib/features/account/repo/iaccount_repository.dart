import 'package:dartz/dartz.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/features/entities/shared/authenticate.dart';
import 'package:lween/core/features/repo/irepository.dart';
import 'package:lween/features/account/models/forget_password_entity.dart';
import 'package:lween/features/account/models/init_app_entity.dart';
import 'package:lween/features/account/models/login_entity.dart';
import 'package:lween/features/account/models/profile_entity.dart';
import 'package:lween/features/account/models/register_entity.dart';
import 'package:lween/features/account/models/verify_account_entity.dart';
import 'package:lween/features/account/params/change_password_params.dart';
import 'package:lween/features/account/params/check_code_params.dart';
import 'package:lween/features/account/params/delete_account_params.dart';
import 'package:lween/features/account/params/edit_profile_params.dart';
import 'package:lween/features/account/params/confirm_change_phone_code_params.dart';
import 'package:lween/features/account/params/enter_forgot_password_params.dart';
import 'package:lween/features/account/params/forget_password_params.dart';
import 'package:lween/features/account/params/get_profile_params.dart';
import 'package:lween/features/account/params/init_app_params.dart';
import 'package:lween/features/account/params/login_params.dart';
import 'package:lween/features/account/params/register_params.dart';
import 'package:lween/features/account/params/request_change_phone_params.dart';
import 'package:lween/features/account/params/resend_code_params.dart';
import 'package:lween/features/account/params/update_token_params.dart';
import 'package:lween/features/account/params/verify_account_params.dart';

abstract class IAccountRepository extends IRepository {
  Future<Either<ErrorEntity, AuthenticateEntity>> logIn(LogInParams model);
  Future<Either<ErrorEntity, InitAppEntity>> initApp(InitAppParams model);

  Future<Either<ErrorEntity, RegisterEntity>> register(RegisterParams model);
  Future<Either<ErrorEntity, AuthenticateEntity>> verify(VerifyAccountParams model);
  Future<Either<ErrorEntity, EmptyEntity>> forgetPassword(ForgetPasswordParams model);
  Future<Either<ErrorEntity, EmptyEntity>> checkCode(CheckCodeParams model);
  Future<Either<ErrorEntity, EmptyEntity>> resendCode(ResendCodeParams model);
  Future<Either<ErrorEntity, EmptyEntity>> enterForgotPassword(EnterForgotPasswordParams model);
  Future<Either<ErrorEntity, EmptyEntity>> updateToken(UpdateTokenParams model);
  Future<Either<ErrorEntity, ProfileEntity>> getProfile(GetProfileParams model);
  Future<Either<ErrorEntity, EmptyEntity>> updateProfile(UpdateProfileParams model);
  Future<Either<ErrorEntity, EmptyEntity>> changePassword(ChangePasswordParams model);
  Future<Either<ErrorEntity, EmptyEntity>> deleteAccount(DeleteAccountParams model);
  Future<Either<ErrorEntity, EmptyEntity>> requestChangePhone(RequestChangePhoneNumberParams model);
  Future<Either<ErrorEntity, EmptyEntity>> confirmChangePhone(ConfirmChangePhoneCodeParams model);

}
