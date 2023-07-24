

import 'package:lween/core/features/entities/entity.dart';

class CompaniesEntity extends ContentModel{

  late final List<CompanyEntity>? items;

  CompaniesEntity([this.items = const []]);

  @override
  fromJson(json) => CompanyEntity.fromJson(json);

  CompaniesEntity.fromJson(json) {
    items = List.from(json).map((e) => CompanyEntity.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => items ?? [];
}

class CompanyEntity extends ContentModel {
  int? id;
  int? travelMethod;
  String? imageUrl;
  String? name;
  int? travelsCount;
  int? centersCount;
  num? rate;
  int? userAvailableSeatsWithoutPayment;
  String? description;
  bool? isFollowed;
  bool? receiveNotifications;

  CompanyEntity({
    this.id,
    this.travelMethod,
    this.imageUrl,
    this.name,
    this.travelsCount,
    this.centersCount,
    this.rate,
    this.userAvailableSeatsWithoutPayment,
    this.description,
    this.isFollowed,
    this.receiveNotifications,
  });

  factory CompanyEntity.fromJson(Map<String, dynamic> json) {
    return CompanyEntity(
      id: json['id'],
      travelMethod: int.tryParse(json['travelMethod'].toString()) ?? 0,
      imageUrl: json['imageUrl'],
      name: json['name'],
      travelsCount: json['travelsCount'],
      centersCount: json['centersCount'],
      rate: json['rate'],
      userAvailableSeatsWithoutPayment: json['userAvailableSeatsWithoutPayment'],
      description: json['description'],
      isFollowed: json['isFollowed'],
      receiveNotifications: json['receiveNotifications'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['travelMethods'] = travelMethod;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['travelsCount'] = travelsCount;
    data['centersCount'] = centersCount;
    data['rate'] = rate;
    data['userAvailableSeatsWithoutPayment'] = userAvailableSeatsWithoutPayment;
    data['description'] = description;
    data['isFollowed'] = isFollowed;
    data['receiveNotifications'] = receiveNotifications;
    return data;
  }

  @override
  fromJson(json) => CompanyEntity.fromJson(json);

  @override
  List<Object?> get props => [id];
}
