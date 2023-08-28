import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

import 'package:lween/core/configurations/app_configuration.dart';
class EnterForgotPasswordParams extends ParamsModel<EnterForgotPasswordParamsBody> {
  EnterForgotPasswordParams({required EnterForgotPasswordParamsBody body})
      : super(body: body, baseUrl: AppConfigurations.BaseUrl);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.enterNewPassword;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class EnterForgotPasswordParamsBody extends BaseBodyModel {
  EnterForgotPasswordParamsBody({
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.code,
  });
  late final String username;
  late final String password;
  late final String confirmPassword;
  late final String code;

  EnterForgotPasswordParamsBody.fromJson(Map<String, dynamic> json){
    username = json['username'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    code = json['code'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['code'] = code;
    return data;
  }
}
