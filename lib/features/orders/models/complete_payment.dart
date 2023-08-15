
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/shared/lite_entity.dart';
import 'package:lween/features/home/models/home_entity.dart';

class CompletePaymentEntity extends ContentModel {
  int? statusCode;

  CompletePaymentEntity({
    this.statusCode,
  });

  CompletePaymentEntity.fromJson(json) {
    statusCode = json['statusCode'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['statusCode'] = statusCode;
    return data;
  }

  @override
  fromJson(json) => CompletePaymentEntity.fromJson(json);

  @override
  List<Object?> get props => [statusCode,];
}

