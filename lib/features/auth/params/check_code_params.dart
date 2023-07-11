import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

enum ConfirmationCodeType
{
  forgetPassword,
  confirmAccount,
  changePhoneNumber,
  changeEmailAddress;

  int get apiIndex => index + 1;
}

class CheckCodeParams extends ParamsModel<CheckCodeParamsBody> {
  CheckCodeParams({required this.userName,required this.code,required this.confirmationCodeType,})
      : super(body: CheckCodeParamsBody(), baseUrl: AppConfigurations.BaseUrl);

  final String userName;
  final String code;
  final ConfirmationCodeType confirmationCodeType;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.checkCode;

  @override
  bool get authorized => false;

  @override
  Map<String, String> get urlParams => {
    'userName' : userName,
    'type' : confirmationCodeType.apiIndex.toString(),
    'code' :code,
  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class CheckCodeParamsBody extends BaseBodyModel {
  CheckCodeParamsBody();

  @override
  Map<String, dynamic> toJson() => {};
}
