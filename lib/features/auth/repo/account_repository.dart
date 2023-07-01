import 'package:dartz/dartz.dart';
import 'package:lween/core/data/data_sources/remote_data_source.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/features/auth/models/login_entity.dart';
import 'package:lween/features/auth/params/login_params.dart';
import 'package:lween/features/auth/repo/iaccount_repository.dart';
import '../../../../core/exceptions/app_exceptions.dart';

class AccountRepository extends IAccountRepository {
  RemoteDataSource remoteDataSource;

  AccountRepository(this.remoteDataSource);


  @override
  Future<Either<ErrorEntity, LogInEntity>> logIn(LogInParams model) async {
    try {
      var res = await remoteDataSource.getData<LogInEntity>(
          model,
              () => LogInEntity());
      return Right(res.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

//   @override
//   Future<Either<ErrorEntity, RegisterEntity>> register(
//       RegisterParams model) async {
//     try {
//       final RegisterModel remote = await remoteDataSource.register(model);
//       return Right(remote.toEntity());
//     } on AppException catch (e) {
//       return Left(ErrorEntity.fromAppException(e));
//     }
//   }
//
//   @override
//   Future<Either<ErrorEntity, VerifyAccountEntity>> verifyAccount(
//       VerifyAccountParams model) async {
//     try {
//       final VerifyAccountModel remote =
//           await remoteDataSource.verifyAccount(model);
//       return Right(remote.toEntity());
//     } on AppException catch (e) {
//       return Left(ErrorEntity.fromAppException(e));
//     }
//   }
//
//   @override
//   Future<Either<ErrorEntity, ChangePasswordEntity>> changePassword(
//     ChangePasswordParams model,
//   ) async {
//     try {
//       final remote = await remoteDataSource.changePassword(model);
//       return Right(remote.toEntity());
//     } on AppException catch (e) {
//       return Left(ErrorEntity.fromAppException(e));
//     }
//   }
//
//   @override
//   Future<Either<ErrorEntity, ResendCodeEntity>> resendCode(
//       ResendCodeParams model) async {
//     try {
//       final ResendCodeModel remote = await remoteDataSource.resendCode(model);
//       return Right(remote.toEntity());
//     } on AppException catch (e) {
//       return Left(ErrorEntity.fromAppException(e));
//     }
//   }
// /// forgetPass
//   @override
//   Future<Either<ErrorEntity, ForgetPasswordEntity>> forgetPassword(
//       ForgetPasswordParams model) async {
//     try {
//       final remote = await remoteDataSource.forgetPassword(model);
//       return Right(remote.toEntity());
//     } on AppException catch (e) {
//       return Left(ErrorEntity.fromAppException(e));
//     }
//   }
//   @override
//   Future<Either<ErrorEntity, CheckCodeEntity>> checkCode(CheckCodeParams model) async {
//     try {
//       final remote = await remoteDataSource.checkCode(model);
//       return Right(remote.toEntity());
//     } on AppException catch (e) {
//       return Left(ErrorEntity.fromAppException(e));
//     }
//   }
//   @override
//   Future<Either<ErrorEntity, ResetPasswordEntity>> resetPassword(
//       ResetPasswordParams model) async {
//     try {
//       final remote = await remoteDataSource.resetPassword(model);
//       return Right(remote.toEntity());
//     } on AppException catch (e) {
//       return Left(ErrorEntity.fromAppException(e));
//     }
//   }



}
