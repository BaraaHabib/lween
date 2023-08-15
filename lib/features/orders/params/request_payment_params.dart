import 'package:equatable/equatable.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';


class RequestPaymentParams extends ParamsModel<RequestPaymentBodyParams> {
  RequestPaymentParams({
    required RequestPaymentBodyParams body,
  })
      : super(body: body,);

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.requestPayment;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

  @override
  bool get authorized => true;

}

class RequestPaymentBodyParams extends BaseBodyModel with EquatableMixin {
  String accountNumber;
  PaymentMethod paymentType;
  num priceToBePaid;
  String entityId;
  int toBePaidEntityType;

  RequestPaymentBodyParams({
    required this.accountNumber,
    required this.paymentType,
    required this.priceToBePaid,
    required this.entityId,
    this.toBePaidEntityType = 1,
  });


  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountNumber'] = accountNumber;
    data['paymentType'] = paymentType.paymentProviderEnum;
    data['priceToBePaid'] = priceToBePaid;
    data['entityId'] = entityId;
    data['toBePaidEntityType'] = toBePaidEntityType;
    return data;
  }


  @override
  List<Object?> get props =>
      [
        accountNumber,
        priceToBePaid,
        paymentType,
        entityId,
      ];
}

