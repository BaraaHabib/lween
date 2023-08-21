import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/shared/country.dart';
import 'package:lween/core/features/entities/shared/lite_entity.dart';

class ProfileEntity extends ContentModel {
  int? externalLoginProvider;
  int? accountType;
  int? id;
  String? imageUrl;
  String? name;
  String? phoneNumber;
  String? balance;
  String? ordersCount;
  LiteEntity? country;
  LiteEntity? city;

  ProfileEntity(
      {
        this.externalLoginProvider,
        this.accountType,
        this.id,
        this.imageUrl,
        this.name,
        this.phoneNumber,
        this.balance,
        this.ordersCount,
        this.country,
        this.city,
});

  factory ProfileEntity.fromJson(json) {
    return ProfileEntity(
      externalLoginProvider: json['externalLoginProvider'],
      accountType: json['accountType'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      balance: json['balance'],
      ordersCount: json['ordersCount'],
      country: json['country'] != null
          ? LiteEntity.fromJson(json['country'])
          : null,
      city: json['city'] != null
          ? LiteEntity.fromJson(json['city'])
          : null,
    );
  }

  @override
  fromJson(json) => ProfileEntity.fromJson(json);

  @override
  List<Object?> get props => [];
}

