
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/shared/lite_entity.dart';
import 'package:lween/features/home/models/home_entity.dart';

class CouponEntity extends ContentModel {
  num? percentage;
  num? value;

  CouponEntity({this.value,
    this.percentage,
  });

  CouponEntity.fromJson(json) {
    percentage = json['percentage'];
    value = json['value'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['percentage'] = percentage;
    data['value'] = value;
    return data;
  }

  @override
  fromJson(json) => CouponEntity.fromJson(json);

  @override
  List<Object?> get props => [percentage,value,];
}

