
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/features/auth/params/check_code_params.dart';

class ResendPaymentCodeParams extends ParamsModel<ResendPaymentCodeParamsBody> {
  ResendPaymentCodeParams({required ResendPaymentCodeParamsBody body,})
      : super(body: body,);

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.resendPaymentCode;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class ResendPaymentCodeParamsBody extends BaseBodyModel {
  ResendPaymentCodeParamsBody(
      {
        required this.accountNumber,
        required this.paymentType,
        required this.transactionId,
      });

  String accountNumber;
  PaymentMethod paymentType;
  String transactionId;


  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accountNumber'] = accountNumber;
    data['paymentType'] = paymentType.paymentProviderEnum;
    data['transactionId'] = transactionId;
    return data;
  }
}
