import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class GetCompaniesParams extends ParamsModel<GetCompaniesBody> {
  GetCompaniesParams(
      {int page = 0,})
      : super(body: GetCompaniesBody(),page: page,);

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.transportationEntities;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

  @override
  bool get authorized => true;
}

class GetCompaniesBody extends BaseBodyModel {
  GetCompaniesBody();

  @override
  Map<String, dynamic> toJson() => {};
}
