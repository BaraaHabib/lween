import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class GetProfileParams extends ParamsModel<GetProfileParamsBody> {
  GetProfileParams()
      : super(body: GetProfileParamsBody(),);

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.getProfile;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class GetProfileParamsBody extends BaseBodyModel {
  GetProfileParamsBody();

  @override
  Map<String, dynamic> toJson() => {};
}
