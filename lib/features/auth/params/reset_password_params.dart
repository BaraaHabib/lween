import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';
class ResetPasswordParams extends ParamsModel<ResetPasswordParamsBody> {
  ResetPasswordParams({required ResetPasswordParamsBody body})
      : super(body: body, baseUrl: AppConfigurations.BaseUrl);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => 'Patient/ChangeForgottenPassword';

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class ResetPasswordParamsBody extends BaseBodyModel {
  ResetPasswordParamsBody({
    this.phoneNumber,
    this.code,
    this.password,
  });
  final String? phoneNumber;
  final String? code;
  final String? password;

  @override
  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'code': code,
        'password': password,
      };
}
