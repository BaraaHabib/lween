import 'package:equatable/equatable.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';


class CreateOrderParams extends ParamsModel<CreateOrderBodyParams> {
  CreateOrderParams({
    required CreateOrderBodyParams body,
  })
      : super(body: body,);
  
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.createOrder;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

  @override
  bool get authorized => true;

}

class CreateOrderBodyParams extends BaseBodyModel with EquatableMixin {
  String? orderCreationTimestamp;
  String? travelId;
  String? executionDate;
  List<SeatParam>? seats = [];
  double? price;
  int? paymentMethod;

  CreateOrderBodyParams({this.orderCreationTimestamp,
    this.travelId,
    this.executionDate,
    this.seats,
    this.price,
    this.paymentMethod
  });


  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderCreationTimestamp'] = orderCreationTimestamp;
    data['travelId'] = travelId;
    data['executionDate'] = executionDate;
    if (seats != null) {
      data['seats'] = seats!.map((v) => v.toJson()).toList();
    }
    data['price'] = price;
    data['paymentMethod'] = paymentMethod;
    return data;
  }

  CreateOrderBodyParams copyWith(
      {String? orderCreationTimestamp,
      String? travelId,
      String? executionDate,
      List<SeatParam>? seats,
      double? price,
      int? paymentMethod}){

    return CreateOrderBodyParams(
      seats: seats ?? this.seats,
      executionDate: executionDate ?? this.executionDate,
      orderCreationTimestamp: orderCreationTimestamp ?? this.executionDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      price: price ?? this.price,
      travelId: travelId ?? this.travelId,
    );
  }

  @override
  List<Object?> get props =>
      [
        orderCreationTimestamp,
        travelId,
        executionDate,
        ...(seats ?? []),
        price,
        paymentMethod
      ];
}

class SeatParam {
  String? personName;
  int? seatNumber;

  SeatParam({this.personName, this.seatNumber});

  SeatParam.fromJson(Map<String, dynamic> json) {
    personName = json['personName'];
    seatNumber = json['seatNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['personName'] = personName;
    data['seatNumber'] = seatNumber;
    return data;
  }
}
