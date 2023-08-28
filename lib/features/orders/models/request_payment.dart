
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/shared/lite_entity.dart';
import 'package:lween/features/home/models/home_entity.dart';

class RequestPaymentEntity extends ContentModel {
  String? paymentURL;
  num? price;
  String? transactionId;

  RequestPaymentEntity({
    this.paymentURL,
    this.price,
    this.transactionId,
  });

  RequestPaymentEntity.fromJson(json) {
    paymentURL = json['paymentURL'];
    price = json['price'];
    transactionId = json['transactionId'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['paymentURL'] = paymentURL;
    data['price'] = price;
    data['transactionId'] = transactionId;
    return data;
  }

  @override
  fromJson(json) => RequestPaymentEntity.fromJson(json);

  @override
  List<Object?> get props => [price,transactionId,];
}

