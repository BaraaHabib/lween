import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class VerifyAccountParams extends ParamsModel<VerifyAccountParamsBody> {
  VerifyAccountParams({required VerifyAccountParamsBody body})
      : super(body: body, baseUrl: AppConfigurations.BaseIdentityUrl);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => 'Patient/VerifyCode';

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class VerifyAccountParamsBody extends BaseBodyModel {
  VerifyAccountParamsBody({
    required this.patientId,
    required this.verificationCode,
    required this.password,
  });
  late final int patientId;
  late final String verificationCode;
  late final String password;

  VerifyAccountParamsBody.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    verificationCode = json['verificationCode'];
    password = json['password'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['patientId'] = patientId;
    data['verificationCode'] = verificationCode;
    data['password'] = password;
    return data;
  }
}
