import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class ForgetPasswordParams extends ParamsModel<ForgetPasswordParamsBody> {
  ForgetPasswordParams({required this.phone,})
      : super(body: ForgetPasswordParamsBody(), baseUrl: AppConfigurations.BaseUrl);

  final String phone;
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.forgotPassword;

  @override
  Map<String, String> get urlParams => {
    'username':phone,
  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class ForgetPasswordParamsBody extends BaseBodyModel {
  ForgetPasswordParamsBody();

  @override
  Map<String, dynamic> toJson() => {
      };
}
