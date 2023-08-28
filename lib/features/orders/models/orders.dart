
import 'package:flutter/material.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/shared/lite_entity.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/features/home/models/home_entity.dart';
import 'package:lween/generated/l10n.dart';

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
  String? finalStateText;
  LiteEntity? fromCity;
  LiteEntity? toCity;
  bool? canBeCanceled;

  String get formattedTravelTimeDate => AppConfigurations.appDisplayDateFormat.format(travelTimeDate);
  String get formattedTravelTime => AppConfigurations.appDisplayTimeFormat.format(travelTimeDate);

  DateTime get travelTimeDate => DateTime.tryParse(travelTime ?? '')?.toLocal() ?? DateTime.now();

  OrderPaymentStatus get statusEnum {
    switch(status){
      case -2:
        return OrderPaymentStatus.rejected;
      case -1:
        return OrderPaymentStatus.canceled;
      case 1:
        return OrderPaymentStatus.pending;
      case 2:
        return OrderPaymentStatus.paid;
      case 3:
        return OrderPaymentStatus.convertedToPhysicalTicket;
        default:
          return OrderPaymentStatus.pending;
    }
  }

  PaymentMethod get paymentMethodEnum {
    switch(paymentProvider) {
      case 1:
        return PaymentMethod.cashMobile;
      case 2:
        return PaymentMethod.bemo;
      case 3:
        return PaymentMethod.fatora;
      case 4:
        return PaymentMethod.eCash;
      default:
        return PaymentMethod.cash;
    }
  }

  bool get isPaid => statusEnum == OrderPaymentStatus.paid;

  bool get isRejected => statusEnum == OrderPaymentStatus.rejected;

  bool get isConverted => statusEnum == OrderPaymentStatus.convertedToPhysicalTicket;

  bool get isPending => statusEnum == OrderPaymentStatus.pending;

  bool get isCanceled => statusEnum == OrderPaymentStatus.canceled;


  String get currentPaymentStatusText {
    if(paymentMethodEnum == PaymentMethod.cash && paymentMethod == PaymentMethod.cash.type){
      if (isPaid || isConverted) {
        return S.current.payedInCenter;
      }
      else if(isPending){
        return S.current.waitingPaymentInCompanyCenter;
      }
    }
    else if(!isPaid && paymentMethodEnum.isOnlinePayment){
      return S.current.orderNotCompletedMessage;
    }
    return S.current.payedWithValue(paymentProviderText ?? '');
  }

  bool get isPayedInCenter => paymentMethod == PaymentMethod.cash.type && paymentProvider == null;
  bool get isPaymentByPhone =>
      paymentMethodEnum == PaymentMethod.cashMobile;
  bool get isOnlinePayment =>
      paymentMethod != PaymentMethod.cash.type;

  Color? paymentStatusTextColor(BuildContext context) {
    if (!isPaid) {
      return Styles.colorOrange;
    }
    return context.textTheme.headlineMedium?.color;
  }

  String? get paymentAmountText {
    if (isPayedInCenter) {
      if (isPaid) {
        return S.current.payedInCenter;
      }
    }
    else if (isOnlinePayment) {
      if (isPaid) {
        return S.current.payedAmount(price.toString());
      }
    }
    return '';
  }

  Color? paymentAmountTextColor(BuildContext context) {
    if (isPaid) {
      return Styles.blueColor;
    }
    return Styles.colorOrange;
  }


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
    finalStateText = json['finalStateText'];
    canBeCanceled = json['canBeCanceled'];
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
    data['finalStateText'] = finalStateText;
    data['canBeCanceled'] = canBeCanceled;
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
