
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/shared/lite_entity.dart';
import 'package:lween/features/home/models/home_entity.dart';

class OrdersEntity extends ContentModel{

  late final List<OrderEntity>? orders;

  OrdersEntity([this.orders = const []]);

  @override
  fromJson(json) => OrdersEntity.fromJson(json);

  OrdersEntity.fromJson(json) {
    orders = List.from(json).map((e) => OrderEntity.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => orders ?? [];
}

class OrderEntity extends ContentModel {
  String? id;
  String? orderNumber;
  String? price;
  int? paymentMethod;
  String? orderPaymentMethodText;
  int? paymentProvider;
  String? paymentProviderText;
  List<ReservedSeatEntity>? seats;
  int? seatsCount;
  int? status;
  LiteCompany? transportationCompany;
  String? travelTime;
  LiteEntity? fromCity;
  LiteEntity? toCity;

  String get formattedTravelTimeDate => AppConfigurations.appDisplayDateFormat.format(travelTimeDate);

  DateTime get travelTimeDate => DateTime.tryParse(travelTime ?? '')?.toLocal() ?? DateTime.now();

  OrderEntity(
      {this.id,
        this.orderNumber,
        this.price,
        this.paymentMethod,
        this.orderPaymentMethodText,
        this.paymentProvider,
        this.paymentProviderText,
        this.seats,
        this.seatsCount,
        this.status,
        this.transportationCompany,
        this.travelTime,
        this.fromCity,
        this.toCity,
      });

  OrderEntity.fromJson(json) {
    id = json['id'];
    orderNumber = json['orderNumber'];
    price = json['price'];
    paymentMethod = json['paymentMethod'];
    orderPaymentMethodText = json['orderPaymentMethodText'];
    paymentProvider = json['paymentProvider'];
    paymentProviderText = json['paymentProviderText'];
    if (json['seats'] != null) {
      seats = <ReservedSeatEntity>[];
      json['seats'].forEach((v) {
        seats?.add(ReservedSeatEntity.fromJson(v));
      });
    }
    seatsCount = json['seatsCount'];
    status = json['status'];
    transportationCompany = json['transportationEntity'] != null
        ? LiteCompany.fromJson(json['transportationEntity'])
        : null;
    fromCity = json['fromCity'] != null
        ? LiteEntity.fromJson(json['fromCity'])
        : null;
    toCity = json['toCity'] != null
        ? LiteEntity.fromJson(json['toCity'])
        : null;
    travelTime = json['travelTime'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['id'] = id;
    data['orderNumber'] = orderNumber;
    data['price'] = price;
    data['paymentMethod'] = paymentMethod;
    data['orderPaymentMethodText'] = orderPaymentMethodText;
    data['paymentProvider'] = paymentProvider;
    data['paymentProviderText'] = paymentProviderText;
    if (seats != null) {
      data['seats'] = seats?.map((v) => v.toJson()).toList();
    }
    data['seatsCount'] = seatsCount;
    data['status'] = status;
    if (transportationCompany != null) {
      data['transportationEntity'] = transportationCompany?.toJson();
    }
    data['travelTime'] = travelTime;
    return data;
  }

  @override
  fromJson(json) => OrderEntity.fromJson(json);

  @override
  List<Object?> get props => [id,];
}

class SeatEntity extends ContentModel {
  bool? isAvailable;
  int? number;
  bool isDivider = false;
  SeatEntity({this.number,this.isDivider = false,});

  SeatEntity.fromJson(Map<String?, dynamic>? json) {
    if(json == null){
      isDivider = true;
    }else{
      number = json['number'];
      isAvailable = json['isAvailable'] ?? false;
    }

  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['number'] = number;
    data['isAvailable'] = isAvailable;
    return data;
  }

  @override
  fromJson(json) => SeatEntity.fromJson(json);

  @override
  List<Object?> get props => [number,isAvailable,];
}

class ReservedSeatEntity extends ContentModel {
  String? personName;
  int? seatNumber;

  ReservedSeatEntity({this.seatNumber,});

  ReservedSeatEntity.fromJson(Map<String?, dynamic>? json) {
    if(json == null){
      // isDivider = true;
    }else{
      seatNumber = json['seatNumber'];
      personName = json['personName'];
    }

  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['seatNumber'] = seatNumber;
    data['personName'] = personName;
    return data;
  }

  @override
  fromJson(json) => SeatEntity.fromJson(json);

  @override
  List<Object?> get props => [seatNumber,seatNumber,];
}
