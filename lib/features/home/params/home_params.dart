import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class HomeParams extends ParamsModel<HomeParamsBody> {
  HomeParams()
      : super(body: HomeParamsBody(),);


  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.home;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

  @override
  bool get authorized => true;
}

class HomeParamsBody extends BaseBodyModel {
  HomeParamsBody();

  @override
  Map<String, dynamic> toJson() => {};
}
