import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class InitAppParams extends ParamsModel<InitAppParamsBody> {
  InitAppParams(
      {required this.deviceType, required this.deviceVersion,})
      : super(body: InitAppParamsBody(),);

  final int deviceType;
  final String deviceVersion;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.initApp;

  @override
  Map<String, String> get urlParams => {
    'DeviceType' : deviceType.toString(),
    'DeviceVersion' : deviceVersion.toString(),
  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class InitAppParamsBody extends BaseBodyModel {
  InitAppParamsBody();

  @override
  Map<String, dynamic> toJson() => {};
}
