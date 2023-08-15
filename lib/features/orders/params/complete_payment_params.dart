import 'package:equatable/equatable.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';


class CompletePaymentParams extends ParamsModel<CompletePaymentBodyParams> {
  CompletePaymentParams({
    required CompletePaymentBodyParams body,
  })
      : super(body: body,);

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.completePayment;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

}

class CompletePaymentBodyParams extends BaseBodyModel with EquatableMixin {
  String accountNumber;
  String transactionId;
  PaymentMethod paymentType;
  String confirmationCode;

  CompletePaymentBodyParams({
    required this.accountNumber,
    required this.transactionId,
    required this.paymentType,
    required this.confirmationCode,
  });


  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountNumber'] = accountNumber;
    data['transactionId'] = transactionId;
    data['paymentType'] = paymentType.paymentProviderEnum;
    data['confirmationCode'] = confirmationCode;
    return data;
  }


  @override
  List<Object?> get props =>
      [
        accountNumber,
        paymentType,
        transactionId,
        confirmationCode,
      ];
}

