import 'package:dartz/dartz.dart';
import 'package:lween/core/data/data_sources/remote_data_source.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/features/entities/shared/authenticate.dart';
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
import 'package:lween/features/auth/repo/iaccount_repository.dart';
import '../../../../core/exceptions/app_exceptions.dart';

class AccountRepository extends IAccountRepository {
  RemoteDataSource remoteDataSource;

  AccountRepository(this.remoteDataSource);


  @override
  Future<Either<ErrorEntity, AuthenticateEntity>> logIn(LogInParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<AuthenticateEntity>.fromJson(res,parser: AuthenticateEntity.fromJson,);
      // Entity.fromJson(res);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, InitAppEntity>> initApp(InitAppParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity.fromJson(res,parser: InitAppEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, RegisterEntity>> register(
      RegisterParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      Entity<RegisterEntity> data = Entity<RegisterEntity>.fromJson(res,parser: RegisterEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }
//
  @override
  Future<Either<ErrorEntity, AuthenticateEntity>> verify(
      VerifyAccountParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<AuthenticateEntity>.fromJson(res,parser: AuthenticateEntity.fromJson,);
      // Entity.fromJson(res);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }
/// forgetPass
  @override
  Future<Either<ErrorEntity, EmptyEntity>> forgetPassword(
      ForgetPasswordParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      Entity<EmptyEntity> data = Entity<EmptyEntity>.fromJson(res,parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }
  @override
  Future<Either<ErrorEntity, EmptyEntity>> checkCode(CheckCodeParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      Entity<EmptyEntity> data = Entity<EmptyEntity>.fromJson(res,parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }
  @override
  Future<Either<ErrorEntity, EmptyEntity>> resendCode(ResendCodeParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      Entity<EmptyEntity> data = Entity<EmptyEntity>.fromJson(res,parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, EmptyEntity>> enterForgotPassword(EnterForgotPasswordParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      Entity<EmptyEntity> data = Entity<EmptyEntity>.fromJson(res,parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }
  @override
  Future<Either<ErrorEntity, EmptyEntity>> updateToken(UpdateTokenParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      Entity<EmptyEntity> data = Entity<EmptyEntity>.fromJson(res,parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }



}
