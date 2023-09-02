
import 'package:collection/collection.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/shared/lite_entity.dart';
import 'package:lween/core/resources/constants.dart';
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
  List<List<SeatEntity>>? seats;
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
  LiteCompanyEntity? transportationEntity;
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
  List<(int, int, SeatEntity)> get seatsMatrix {
    final res = <(int, int, SeatEntity)>[];
    for (var (rIndex, seatsRow) in seats!.indexed) {
      for (var (cIndex, seat) in seatsRow.indexed) {
        res.add((rIndex, cIndex, seat));
      }
    }
    return res;
  }

  factory TravelEntity.fromJson(Map<String?, dynamic> json) {
    return TravelEntity(
      id: json['id'],
      travelTime: json['travelTime'],
      availableDaysText: json['availableDaysText'],
      isVip: json['isVip'],
      seatsCount: json['seatsCount'],
      seats: List<List<SeatEntity>>.from(json['seats'].map((x) =>
      List<SeatEntity>.from(x.map((x) => SeatEntity.fromJson(x))))),
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
      LiteCompanyEntity.fromJson(json['transportationEntity']),
      images: List<String>.from(json['images'].map((x) => x)),

    );
  }

  String get fromToText => '${fromCity?.text} - ${toCity?.text}';

  VehicleType get travelMethodEnum {
    late VehicleType type;
    switch(travelMethod ?? 5){
      case 1:
        type = VehicleType.bus;
        break;
      case 2:
        type = VehicleType.van;
        break;
      case 3:
        type = VehicleType.microbus;
        break;
      case 4:
        type = VehicleType.car;
        break;
      default:
        type = VehicleType.other;
        break;
    }
    return type;
  }

  @override
  fromJson(json) => TravelEntity.fromJson(json);

  @override
  List<Object?> get props => [id,];
}

class AvailableSeatsEntity extends ContentModel{

  List<List<SeatEntity>>? seats;

  @override
  fromJson(json) => AvailableSeatsEntity.fromJson(json);

  factory AvailableSeatsEntity.fromJson(json) {
    return AvailableSeatsEntity(
      seats: List<List<SeatEntity>>.from(json.map((x) =>
      List<SeatEntity>.from(
        x.map((x) =>
            SeatEntity.fromJson(
              x,
            ),
        ),
      ),
      ),
      ),
    );
  }

  @override
  List<Object?> get props => (seats ?? []).flattened.toList();

  AvailableSeatsEntity({this.seats,});
}
