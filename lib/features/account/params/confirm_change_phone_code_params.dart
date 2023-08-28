import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

class ConfirmChangePhoneCodeParams extends ParamsModel<ConfirmChangePhoneCodeParamsBody> {
  ConfirmChangePhoneCodeParams({required ConfirmChangePhoneCodeParamsBody body,})
      : super(body: body, baseUrl: AppConfigurations.BaseUrl,);


  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.confirmChangePhone;

  @override
  Map<String, String> get urlParams => {

  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class ConfirmChangePhoneCodeParamsBody extends BaseBodyModel {
  ConfirmChangePhoneCodeParamsBody({required this.password,required this.code,});

  final String password;
  final String code;

  @override
  Map<String, dynamic> toJson() => {
    'password' : password,
    'code' :code,
  };
}
