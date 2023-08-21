import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

class LogInParams extends ParamsModel<LogInParamsBody> {
  LogInParams({required LogInParamsBody body})
      : super(body: body,);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.login;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class LogInParamsBody extends BaseBodyModel {
  LogInParamsBody({
    required this.userName,
    required this.password,
    required this.rememberClient,
  });
  late final String userName;
  late final String password;
  late final bool rememberClient;

  LogInParamsBody.fromJson(Map<String, dynamic> json){
    userName = json['userName'];
    password = json['password'];
    rememberClient = json['rememberClient'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userName'] = userName;
    data['password'] = password;
    data['rememberClient'] = rememberClient;
    return data;
  }
}
