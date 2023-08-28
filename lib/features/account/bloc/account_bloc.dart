import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/entities/shared/authenticate.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/core/services/files/file_manager.dart';
import 'package:lween/features/account/models/profile_entity.dart';
import 'package:lween/features/account/models/register_entity.dart';
import 'package:lween/features/account/params/change_password_params.dart';
import 'package:lween/features/account/params/check_code_params.dart';
import 'package:lween/features/account/params/delete_account_params.dart';
import 'package:lween/features/account/params/edit_profile_params.dart';
import 'package:lween/features/account/params/confirm_change_phone_code_params.dart';
import 'package:lween/features/account/params/enter_forgot_password_params.dart';
import 'package:lween/features/account/params/forget_password_params.dart';
import 'package:lween/features/account/params/login_params.dart';
import 'package:lween/features/account/params/refresh_token_params.dart';
import 'package:lween/features/account/params/register_params.dart';
import 'package:lween/features/account/params/request_change_phone_params.dart';
import 'package:lween/features/account/params/resend_code_params.dart';
import 'package:lween/features/account/params/verify_account_params.dart';
import 'package:lween/features/account/repo/account_repository.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';


part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final accountRepo = sl<AccountRepository>();

  static AccountBloc get instance => sl<AccountBloc>();

  AccountBloc() : super(AccountInitial()) {
    on<LogInEvent>(_loginCallback);
    on<RegisterEvent>(_registerCallback);
    on<VerifyAccountEvent>(_verifyAccountCallback);
    on<CheckCodeEvent>(_checkCodeCallback);
    on<EnterForgotPasswordEvent>(_enterForgotPasswordEventCallback);
    on<ResendCodeEvent>(_resendVerifyCodeCallback);
    on<ForgetPasswordEvent>(_forgetPasswordEventCallback);
    on<GetProfileEvent>(_getProfileEventCallback);
    on<UpdateProfileEvent>(_updateProfileEventCallback);
    on<ChangePasswordEvent>(_changePasswordEventCallback);
    on<DeleteAccountEvent>(_deleteAccountEventCallback);
    on<RequestChangePhoneEvent>(_requestChangePhoneEventCallback);
    on<ConfirmChangePhoneCodeEvent>(_confirmChangePhoneCodeEventCallback);
  }

  FutureOr<void> _verifyAccountCallback(VerifyAccountEvent event, emit) async {
    emit(VerifyAccountLoading());
    var res = await accountRepo.verify(event.params,);
    emit(res.fold(
          (l) => VerifyAccountError(l.errorMessage,),
          (r) => VerifyAccountLoaded(r,),
    ),
    );
  }


  FutureOr<void> _resendVerifyCodeCallback(ResendCodeEvent event, emit) async {
    emit(ResendCodeLoading());
    var res = await accountRepo.resendCode(event.params,);
    emit(res.fold(
          (l) => ResendCodeError(l.errorMessage,),
          (r) => const ResendCodeLoaded(),
    ));
  }

  Future<FutureOr<void>> _registerCallback(RegisterEvent event,
      Emitter<AccountState> emit) async {
    emit(RegisterLoading());

    var res = await accountRepo.register(event.params,);
    emit(res.fold(
          (l) => RegisterError(l.errorMessage),
          (r) => RegisterLoaded(r,),
    ));
  }


  static Future<Map<String, dynamic>> refreshSession(ParamsModel model,
      RefreshTokenParamsBody model1) async {
    Response response;
    final tokenDio = Dio();
    try {
      final headersRefresh = <String, String>{};
      headersRefresh.addAll({
        'Content-Type': 'application/json',
      });
      if (kDebugMode) {
        AppLogger.log(
            'refresh token body :${json.encode(model.body.toJson())}');
      }
      // var formData = FormData.fromMap(model.body?.toJson() ?? {} );
      final url = model.baseUrl ?? AppConfigurations.env.baseUrl;
      response = await tokenDio.post(
        url + model.url.toString(),
        data: model.body.toJson(),
        queryParameters: model.urlParams,
        options:
        Options(headers: headersRefresh, responseType: ResponseType.plain),
      );
      final responseJson =
      response
          .toString()
          .isEmpty ? null : json.decode(response.toString());
      return responseJson;
    } on Exception {
      rethrow;
    } finally {
      tokenDio.close();
    }
  }

  Future<FutureOr<void>> _loginCallback(LogInEvent event,
      Emitter<AccountState> emit) async {
    emit(LogInLoading());
    var res = await accountRepo.logIn(event.params,);
    emit(res.fold(
          (l) => LogInError(l.errorMessage, l.code, l.data?['accountId']),
          (r) => LogInLoaded(logInEntity: r,),
    ));
  }

  Future<FutureOr<void>> _forgetPasswordEventCallback(ForgetPasswordEvent event,
      Emitter<AccountState> emit) async {
    emit(ForgetPasswordLoading());
    var res = await accountRepo.forgetPassword(event.params,);
    emit(res.fold(
          (l) => ForgetPasswordError(l.errorMessage,),
          (r) => const ForgetPasswordLoaded(),
    ));
  }

  Future<FutureOr<void>> _checkCodeCallback(CheckCodeEvent event,
      Emitter<AccountState> emit) async {
    emit(CheckCodeLoading());
    var res = await accountRepo.checkCode(event.params,);
    emit(res.fold(
          (l) => CheckCodeError(l.errorMessage,),
          (r) => const CheckCodeLoaded(),
    ));
  }

  Future<FutureOr<void>> _enterForgotPasswordEventCallback(
      EnterForgotPasswordEvent event, Emitter<AccountState> emit) async {
    emit(EnterForgotPasswordLoading());
    var res = await accountRepo.enterForgotPassword(event.params,);
    emit(res.fold(
          (l) => EnterForgotPasswordError(l.errorMessage,),
          (r) => const EnterForgotPasswordLoaded(),
    ));
  }

  Future<FutureOr<void>> _getProfileEventCallback(GetProfileEvent event,
      Emitter<AccountState> emit) async {
    emit(GetProfileLoading());
    var res = await accountRepo.getProfile();
    emit(res.fold(
          (l) => GetProfileError(l.errorMessage,),
          (r) => GetProfileLoaded(r,),
    ));
  }

  Future<FutureOr<void>> _updateProfileEventCallback(UpdateProfileEvent event,
      Emitter<AccountState> emit) async {
    emit(UpdateProfileLoading());
    String? newImageRemoteUrl;
    bool imageUploadFail = false;
    if(event.newImagePath != null) {
      final uploadFileRes = await sl<FileManager>().uploadFile(
        event.newImagePath!, UploadFileType.profile.apiValue,);

      if(uploadFileRes.isLeft()){
        uploadFileRes.fold((l) => emit(UpdateProfileError(l.errorMessage,uploadProfileError: true,)), (r) => null,);
        imageUploadFail = true;
      }else{
        newImageRemoteUrl =
            uploadFileRes.fold((l) => null, (r) => r.url,);
      }
    }
    if(!imageUploadFail){
      var res = await accountRepo.updateProfile(
        UpdateProfileParams(UpdateProfileParamsBody(
          name: event.name,
          imageUrl: newImageRemoteUrl ?? event.imageUrl,
          cityId: event.cityId,
        ),
        ),
      );
      emit(res.fold(
            (l) => UpdateProfileError(l.errorMessage,),
            (r) => UpdateProfileLoaded(newImageRemoteUrl: newImageRemoteUrl,),
      ));
    }

  }


  Future<FutureOr<void>> _changePasswordEventCallback(ChangePasswordEvent event, Emitter<AccountState> emit) async {
    emit(ChangePasswordLoading());
    var res = await accountRepo.changePassword(
        ChangePasswordParams(
          ChangePasswordParamsBody(
            currentPassword: event.currentPassword,
            newPassword: event.newPassword
          ),
        ));
    emit(res.fold(
          (l) => ChangePasswordError(l.errorMessage,),
          (r) => const ChangePasswordLoaded(),),
    );
  }




  Future<FutureOr<void>> _deleteAccountEventCallback(DeleteAccountEvent event, Emitter<AccountState> emit) async {
    emit(DeleteAccountLoading());
    var res = await accountRepo.deleteAccount(
        DeleteAccountParams(
          body: DeleteAccountParamsBody(
            password: event.password,
          ),
        ),
    );
    emit(res.fold(
          (l) => DeleteAccountError(l.errorMessage,),
          (r) => const DeleteAccountLoaded(),),
    );
  }



  Future<FutureOr<void>> _requestChangePhoneEventCallback(RequestChangePhoneEvent event, Emitter<AccountState> emit) async {
    emit(RequestChangePhoneLoading());
    var res = await accountRepo.requestChangePhone(
      RequestChangePhoneNumberParams(
        phoneNumber: event.newPhoneNumber,
      ),
    );
    emit(res.fold(
          (l) => RequestChangePhoneError(l.errorMessage,),
          (r) => const RequestChangePhoneLoaded(),),
    );
  }

  Future<FutureOr<void>> _confirmChangePhoneCodeEventCallback(ConfirmChangePhoneCodeEvent event, Emitter<AccountState> emit) async {
    emit(ConfirmChangePhoneCodeLoading());
    var res = await accountRepo.confirmChangePhone(
      ConfirmChangePhoneCodeParams(
        body: ConfirmChangePhoneCodeParamsBody(
          code: event.code,
          password: event.password,
        )
      ),
    );
    emit(res.fold(
          (l) => ConfirmChangePhoneCodeError(l.errorMessage,),
          (r) => const ConfirmChangePhoneCodeLoaded(),),
    );
  }

  bool buildWhen(AccountState previous, AccountState current) {
    return current is VerifyAccountState || current is ResendCodeState;
  }


  void listener(BuildContext context, AccountState state) {
    if (state is ResendCodeLoaded) {
      AppToast(S
          .of(context)
          .codeWasResentToYourNumber).show();
    }
  }


}
