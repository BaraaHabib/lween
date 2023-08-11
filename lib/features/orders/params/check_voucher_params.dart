import 'package:equatable/equatable.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';


class CheckVoucherParams extends ParamsModel<CheckVoucherBodyParams> {
  CheckVoucherParams({
    this.paymentProvider,
    required this.code,
  })
      : super(body: CheckVoucherBodyParams(),);

  final String code;
  final int? paymentProvider;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.GET;

  @override
  String? get url => ApiConstants.checkVoucher;

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

class CheckVoucherBodyParams extends BaseBodyModel  {

  CheckVoucherBodyParams();

  @override
  Map<String, dynamic> toJson() => {};

}
