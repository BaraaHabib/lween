import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class RefreshTokenParams extends ParamsModel<RefreshTokenParamsBody> {
  RefreshTokenParams({required RefreshTokenParamsBody body})
      : super(body: body, baseUrl: AppConfigurations.BaseIdentityUrl);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => 'Patient/RefreshToken';

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class RefreshTokenParamsBody extends BaseBodyModel {
  RefreshTokenParamsBody({
    required this.refreshToken,
    required this.deviceToken,
  });
  String refreshToken;
  String deviceToken;

  @override
  Map<String, dynamic> toJson() => {
        'refreshToken': refreshToken,
        'deviceToken': deviceToken,
      };
}
