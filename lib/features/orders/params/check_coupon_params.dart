import 'package:equatable/equatable.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';


class CheckCouponParams extends ParamsModel<CheckCouponBodyParams> {
  CheckCouponParams({
    this.paymentProvider,
    required this.code,
  })
      : super(body: CheckCouponBodyParams(),);

  final String code;
  final int? paymentProvider;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.checkCoupon;

  @override
  Map<String, String> get urlParams => {
    'code' : code,
    if(paymentProvider != null && paymentProvider! <=5 )
      'paymentProvider' : paymentProvider.toString()
    // else
    //   'paymentProvider' : null
  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

  @override
  bool get authorized => true;

}

class CheckCouponBodyParams extends BaseBodyModel  {

  CheckCouponBodyParams();

  @override
  Map<String, dynamic> toJson() => {};

}
