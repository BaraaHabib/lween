import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';


class TravelParams extends ParamsModel<DailyTravelBody> {
  TravelParams({
    int pageLength = 4,
    int page = 0,
    this.transportationEntityId,
  })
      : super(body: DailyTravelBody(),pageLength: pageLength,page: page,);

  final int? transportationEntityId;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.dailyTravels;

  @override
  Map<String, String> get urlParams => {
    if(transportationEntityId != null)
      'TransportationEntityId' : transportationEntityId.toString(),
  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

  @override
  bool get paginated => true;

}

class DailyTravelBody extends BaseBodyModel {
  DailyTravelBody();

  @override
  Map<String, dynamic> toJson() => {};
}
