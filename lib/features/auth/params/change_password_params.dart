import 'package:lween/core/features/params/params_model.dart';
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
  String? get url => 'UserAccount/UpdateUserPassword';

  @override
  Map<String, dynamic> get urlParams => body!.toJson();
}

class ChangePasswordParamsBody extends BaseBodyModel {
  ChangePasswordParamsBody({
    required this.oldPassword,
    required this.newPassword,
  });

  final String oldPassword;
  final String newPassword;

  @override
  Map<String, dynamic> toJson() => {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      };
}
