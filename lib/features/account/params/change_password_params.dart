import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class ChangePasswordParams extends ParamsModel<ChangePasswordParamsBody> {
  ChangePasswordParams(ChangePasswordParamsBody body)
      : super(
          baseUrl: AppConfigurations.BaseUrl,
          body: body,
        );

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.changePassword;

  @override
  Map<String, dynamic> get urlParams => body.toJson();
}

class ChangePasswordParamsBody extends BaseBodyModel {
  ChangePasswordParamsBody({
    required this.currentPassword,
    required this.newPassword,
  });

  final String currentPassword;
  final String newPassword;

  @override
  Map<String, dynamic> toJson() => {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      };
}
