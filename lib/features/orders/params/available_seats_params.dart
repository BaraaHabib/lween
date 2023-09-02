import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';


class AvailableSeatsParams extends ParamsModel<DailyAvailableSeatsBody> {
  AvailableSeatsParams({
    required this.dailyTravelId,
    required this.travelDate,
  })
      : super(body: DailyAvailableSeatsBody(),);

  final String dailyTravelId;
  final DateTime travelDate ;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.availableSeats;

  @override
  Map<String, String> get urlParams => {
    'travelDate' : AppConfigurations.appAPIDateFormat.format(travelDate),
    'dailyTravelId' : dailyTravelId,


  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];


}

class DailyAvailableSeatsBody extends BaseBodyModel {
  DailyAvailableSeatsBody();

  @override
  Map<String, dynamic> toJson() => {};
}
