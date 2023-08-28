import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';


class MyOrdersParams extends ParamsModel<MyOrdersBody> {
  MyOrdersParams({
    int pageLength = 4,
    int page = 0,
    this.ids,
    this.notCompletedYet,
    this.myRecentOrders,
  })
      : super(body: MyOrdersBody(),pageLength: pageLength,page: page,);
  
  final List<String>? ids;
  final bool? notCompletedYet;
  final bool? myRecentOrders;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.listOrders;

  @override
  Map<String, String> get urlParams => {
    if(myRecentOrders != null)
      'myRecentOrders' : '$myRecentOrders',
    if(notCompletedYet != null)
      'NotCompletedYet' : '$notCompletedYet',
    if(ids != null && ids!.isNotEmpty)
      'Ids' : ids!.join('Ids ='),

  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

  @override
  bool get paginated => true;

  @override
  bool get authorized => true;

}

class MyOrdersBody extends BaseBodyModel {
  MyOrdersBody();

  @override
  Map<String, dynamic> toJson() => {};
}
