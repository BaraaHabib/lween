import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';


class GetUpcomingTravelsParams extends ParamsModel<GetUpcomingTravelsBody> {
  GetUpcomingTravelsParams({
    this.cityId,
  })
      : super(body: GetUpcomingTravelsBody(),);

  final int? cityId;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.upcomingTravels;

  @override
  Map<String, String> get urlParams => {
    if(cityId != null)
      'cityId' : cityId.toString(),
  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];


}

class GetUpcomingTravelsBody extends BaseBodyModel {
  GetUpcomingTravelsBody();

  @override
  Map<String, dynamic> toJson() => {};
}
