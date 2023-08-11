import 'package:equatable/equatable.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';


class CancelOrderParams extends ParamsModel<CancelOrderBodyParams> {
  CancelOrderParams({
    required this.orderId,
  })
      : super(body: CancelOrderBodyParams(),);

  final String orderId;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.cancelOrder;

  @override
  Map<String, String> get urlParams => {
    'orderId' : orderId,
  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

  @override
  bool get authorized => true;

}

class CancelOrderBodyParams extends BaseBodyModel {

  CancelOrderBodyParams();


  @override
  Map<String, dynamic> toJson() {
    return {};
  }

}
