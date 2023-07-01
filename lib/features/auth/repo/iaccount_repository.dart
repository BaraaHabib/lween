import 'package:dartz/dartz.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/features/repo/irepository.dart';
import 'package:lween/features/auth/models/login_entity.dart';
import 'package:lween/features/auth/params/login_params.dart';

abstract class IAccountRepository extends IRepository {
  Future<Either<ErrorEntity, LogInEntity>> logIn(LogInParams model);

  // Future<Either<ErrorEntity, RegisterEntity>> register(RegisterParams model);
  //
  // Future<Either<ErrorEntity, VerifyAccountEntity>> verifyAccount(
  //     VerifyAccountParams model);
  //
  // Future<Either<ErrorEntity, ChangePasswordEntity>> changePassword(
  //   ChangePasswordParams model,
  // );
  //
  // Future<Either<ErrorEntity, ResendCodeEntity>> resendCode(
  //   ResendCodeParams model,
  // );


  // Future<Either<ErrorEntity, ForgetPasswordEntity>> forgetPassword(
  //     ForgetPasswordParams model,
  //     );
  // Future<Either<ErrorEntity, CheckCodeEntity>> checkCode(
  //     CheckCodeParams model,
  //     );
  // Future<Either<ErrorEntity, ResetPasswordEntity>> resetPassword(
  //     ResetPasswordParams model,
  //     );

}
