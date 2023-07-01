import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/extended/get_utils/src/extensions/export.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/features/auth/models/forget_password_entity.dart';
import 'package:lween/features/auth/models/login_entity.dart';
import 'package:lween/features/auth/models/register_entity.dart';
import 'package:lween/features/auth/models/verify_account_entity.dart';
import 'package:lween/features/auth/params/change_password_params.dart';
import 'package:lween/features/auth/params/forget_password_params.dart';
import 'package:lween/features/auth/params/refresh_token_params.dart';
import 'package:lween/features/auth/params/register_params.dart';


part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<LogInEvent>((event, emit) async {
      emit(LogInLoading());
      await 3.seconds.delay();
      emit(
        const LogInLoaded(
          logInEntity: null,
        ),
      );
    });

    on<RegisterEvent>(_registerCallback);
    on<VerifyAccountEvent>(_verifyAccountCallback);
    on<ResendCodeEvent>(_resendVerifyCodeCallback);
    on<ChangePasswordEvent>(
            (event, emit) async {
          emit(ChangePasswordLoading());
        });
  }

  FutureOr<void> _verifyAccountCallback(VerifyAccountEvent event, emit) async {
    emit(VerifyAccountLoading());
  }

  FutureOr<void> _resendVerifyCodeCallback(ResendCodeEvent event, emit) async {
    emit(ResendCodeLoading());
  }

  Future<FutureOr<void>> _registerCallback(RegisterEvent event,
      Emitter<AccountState> emit) async {
    emit(RegisterLoading());
  }


  static Future<Map<String, dynamic>> refreshSession(
      ParamsModel model, RefreshTokenParamsBody model1) async {
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
      response.toString().isEmpty ? null : json.decode(response.toString());
      return responseJson;
    } on Exception {
      rethrow;
    } finally {
      tokenDio.close();
    }
  }
}
