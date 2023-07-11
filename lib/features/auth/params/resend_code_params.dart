
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/features/auth/params/check_code_params.dart';

class ResendCodeParams extends ParamsModel<ResendCodeParamsBody> {
  ResendCodeParams({required this.userName,required this.confirmationCodeType,})
      : super(body: ResendCodeParamsBody(),);
  final String userName;
  final ConfirmationCodeType confirmationCodeType;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.resendCode;

  @override
  bool get authorized => false;

  @override
  Map<String, String> get urlParams => {
    'userName' : userName,
    'type' : confirmationCodeType.apiIndex.toString(),
  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class ResendCodeParamsBody extends BaseBodyModel {
  ResendCodeParamsBody();

  ResendCodeParamsBody.fromJson(Map<String, dynamic> json) {
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
