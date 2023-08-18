import 'package:dartz/dartz.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/features/entities/shared/authenticate.dart';
import 'package:lween/core/features/repo/irepository.dart';
import 'package:lween/features/auth/models/forget_password_entity.dart';
import 'package:lween/features/auth/models/init_app_entity.dart';
import 'package:lween/features/auth/models/login_entity.dart';
import 'package:lween/features/auth/models/register_entity.dart';
import 'package:lween/features/auth/models/verify_account_entity.dart';
import 'package:lween/features/auth/params/check_code_params.dart';
import 'package:lween/features/auth/params/enter_forgot_password_params.dart';
import 'package:lween/features/auth/params/forget_password_params.dart';
import 'package:lween/features/auth/params/init_app_params.dart';
import 'package:lween/features/auth/params/login_params.dart';
import 'package:lween/features/auth/params/register_params.dart';
import 'package:lween/features/auth/params/resend_code_params.dart';
import 'package:lween/features/auth/params/update_token_params.dart';
import 'package:lween/features/auth/params/verify_account_params.dart';

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

}
