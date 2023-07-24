
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/shared/lite_entity.dart';
import 'package:lween/features/home/models/home_entity.dart';
import 'package:lween/features/orders/models/orders.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';

class TravelsEntity extends ContentModel{

  late final List<TravelEntity>? travels;

  TravelsEntity([this.travels = const []]);

  @override
  fromJson(json) => TravelsEntity.fromJson(json);

  TravelsEntity.fromJson(json) {
    travels = List.from(json).map((e) => TravelEntity.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => travels?.toList() ?? [];
}

class TravelEntity extends ContentModel {
  String? id;
  bool? isVip;
  int? seatsCount;
  List<List<Seats>>? seats;
  num? price;
  String? priceText;
  String? travelDuration;
  List<int>? availableDays;
  LiteEntity? fromCity;
  LiteEntity? toCity;
  String? startLocation;
  String? destinationLocation;
  int? travelMethod;
  String? travelMethodText;
  String? travelTime;
  String? availableDaysText;
  CompanyEntity? transportationEntity;
  List<String>? images;


  TravelEntity(
      {
        this.id,
        this.isVip,
        this.seatsCount,
        this.seats,
        this.price,
        this.priceText,
        this.travelDuration,
        this.availableDays,
        this.fromCity,
        this.toCity,
        this.startLocation,
        this.destinationLocation,
        this.travelMethod,
        this.travelMethodText,
        this.transportationEntity,
        this.images,
        this.travelTime,
        this.availableDaysText,
});

  factory TravelEntity.fromJson(Map<String?, dynamic> json) {
    return TravelEntity(
      id: json['id'],
      travelTime: json['travelTime'],
      availableDaysText: json['availableDaysText'],
      isVip: json['isVip'],
      seatsCount: json['seatsCount'],
      seats: List<List<Seats>>.from(json['seats'].map((x) =>
      List<Seats>.from(x.map((x) => Seats.fromJson(x))))),
      price: json['price'],
      priceText: json['priceText'],
      travelDuration: json['travelDuration'],
      availableDays:
      List<int>.from(json['availableDays'].map((x) => x)),
      fromCity: LiteEntity.fromJson(json['fromCity']),
      toCity: LiteEntity.fromJson(json['toCity']),
      startLocation: json['startLocation'],
      destinationLocation: json['destinationLocation'],
      travelMethod: json['travelMethod'],
      travelMethodText: json['travelMethodText'],
      transportationEntity:
      CompanyEntity.fromJson(json['transportationEntity']),
      images: List<String>.from(json['images'].map((x) => x)),

    );
  }
  
  @override
  fromJson(json) => TravelEntity.fromJson(json);

  @override
  List<Object?> get props => [id,];
}
