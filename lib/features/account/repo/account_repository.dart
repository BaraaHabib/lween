import 'package:dartz/dartz.dart';
import 'package:lween/core/data/data_sources/remote_data_source.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/features/entities/shared/authenticate.dart';
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
import 'package:lween/features/account/repo/iaccount_repository.dart';
import 'package:lween/main.dart';
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

  @override
  Future<Either<ErrorEntity, ProfileEntity>> getProfile([GetProfileParams? model]) async {
    try {
      var res = await remoteDataSource.getRemoteData(model ?? GetProfileParams(),);
      Entity<ProfileEntity> data = Entity<ProfileEntity>.fromJson(res,parser: ProfileEntity.fromJson,);
      Lween.storage.profile = data.content;
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, EmptyEntity>> updateProfile(UpdateProfileParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      Entity<EmptyEntity> data = Entity<EmptyEntity>.fromJson(res,parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }
  @override
  Future<Either<ErrorEntity, EmptyEntity>> changePassword(ChangePasswordParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      Entity<EmptyEntity> data = Entity<EmptyEntity>.fromJson(res,parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, EmptyEntity>> deleteAccount(DeleteAccountParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      Entity<EmptyEntity> data = Entity<EmptyEntity>.fromJson(res,parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, EmptyEntity>> confirmChangePhone(ConfirmChangePhoneCodeParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      Entity<EmptyEntity> data = Entity<EmptyEntity>.fromJson(res,parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, EmptyEntity>> requestChangePhone(RequestChangePhoneNumberParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      Entity<EmptyEntity> data = Entity<EmptyEntity>.fromJson(res,parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }


}
