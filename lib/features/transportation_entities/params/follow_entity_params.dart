import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class ToggleFollowCompanyParams extends ParamsModel<ToggleFollowCompanyBody> {
  ToggleFollowCompanyParams({required this.follow,required this.transportationId,})
      : super(body: ToggleFollowCompanyBody(),);

  final bool follow;
  final int transportationId;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => follow ? ApiConstants.followCompany : ApiConstants.unfollowCompany;

  @override
  Map<String, String> get urlParams => {
    'transportationId' : transportationId.toString(),
  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

  @override
  bool get authorized => true;
}

class ToggleFollowCompanyBody extends BaseBodyModel {
  ToggleFollowCompanyBody();

  @override
  Map<String, dynamic> toJson() => {};
}
