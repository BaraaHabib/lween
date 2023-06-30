import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class LogInParams extends ParamsModel<LogInParamsBody> {
  LogInParams({required LogInParamsBody body})
      : super(body: body, baseUrl: AppConfigurations.BaseIdentityUrl);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => 'Patient/login';

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class LogInParamsBody extends BaseBodyModel {
  LogInParamsBody({
    this.input,
    this.password,
    this.deviceToken,
  });
  final String? input;
  final String? password;
  final String? deviceToken;

  @override
  Map<String, dynamic> toJson() => {
        'input': input,
        'password': password,
        'deviceToken': deviceToken,
      };
}
