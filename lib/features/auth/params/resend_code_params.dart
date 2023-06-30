
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/constants.dart';

class ResendCodeParams extends ParamsModel<ResendCodeParamsBody> {
  ResendCodeParams({required ResendCodeParamsBody body})
      : super(body: body, baseUrl: AppConfigurations.BaseIdentityUrl);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => 'Patient/ResendCode';

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class ResendCodeParamsBody extends BaseBodyModel {
  ResendCodeParamsBody({
    required this.phoneNumber,
  });
  late final String phoneNumber;

  ResendCodeParamsBody.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;

    return data;
  }
}
