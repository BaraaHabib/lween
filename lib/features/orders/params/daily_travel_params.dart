import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';


class TravelParams extends ParamsModel<DailyTravelBody> {
  TravelParams({
    int pageLength = 4,
    int page = 0,
    this.withPagination = false,
    this.ids = const [],

    this.companyId, this.fromCity, this.toCity, this.date,
  })
      : super(body: DailyTravelBody(),pageLength: withPagination == true ? pageLength : null,page: withPagination == true ? page : null,);

  final int? companyId;
  final bool withPagination;
  final int? fromCity;
  final int? toCity;
  final DateTime? date;
  final List<String> ids;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.dailyTravels;

  @override
  Map<String, String> get urlParams => {
    if(companyId != null)
      'TransportationEntityId' : companyId.toString(),
    'withPagination' : withPagination.toString(),
    if(date != null)
      'TravelDate' : AppConfigurations.appAPIDateFormat.format(date!),
    if(fromCity != null)
      'FromCityId' : fromCity!.toString(),
    if(toCity != null)
      'ToCityId' : toCity!.toString(),
    if(ids.isNotEmpty)
      'Ids': ids.join(','),


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
