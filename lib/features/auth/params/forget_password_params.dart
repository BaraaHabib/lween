import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class ForgetPasswordParams extends ParamsModel<ForgetPasswordParamsBody> {
  ForgetPasswordParams({required ForgetPasswordParamsBody body})
      : super(body: body, baseUrl: AppConfigurations.BaseUrl);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => 'UserAccount/ForgetPassword';

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class ForgetPasswordParamsBody extends BaseBodyModel {
  ForgetPasswordParamsBody({
    this.email,
  });
  final String? email;

  @override
  Map<String, dynamic> toJson() => {
        'email': email,
      };
}
