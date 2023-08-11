

import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class GetNotificationsParams extends ParamsModel<GetNotificationsParamsBody> {
  GetNotificationsParams({
    int page = 0,
    int pageLength = 10,
  })
      : super(body: GetNotificationsParamsBody(),page: page,pageLength: pageLength,);


  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.notifications;

  @override
  Map<String, String> get urlParams => {
  };

  @override
  bool get paginated => true;

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class GetNotificationsParamsBody extends BaseBodyModel {
  GetNotificationsParamsBody();

  @override
  Map<String, dynamic> toJson() => {};
}
