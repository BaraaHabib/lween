import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/shared/country.dart';

class InitAppEntity extends ContentModel {
  String? lastVersion;
  String? lastVersionUrl;
  bool? isUpToDate;
  List<int>? supportedPaymentTypes;
  bool? isAuthenticated;
  bool? inStoreReview;
  String? phoneNumber1;
  String? phoneNumber2;
  String? appSupportLink;
  List<Country>? countries;

  InitAppEntity(
      {this.lastVersion,
        this.lastVersionUrl,
        this.isUpToDate,
        this.isAuthenticated,
        this.inStoreReview,
        this.phoneNumber1,
        this.phoneNumber2,
        this.appSupportLink,
        this.supportedPaymentTypes,
        this.countries});

  InitAppEntity.fromJson(json) {
    lastVersion = json['lastVersion'];
    inStoreReview = json['inStoreReview'] ?? false;
    lastVersionUrl = json['lastVersionUrl'];
    isUpToDate = json['isUpToDate'];
    isAuthenticated = json['isAuthenticated'];
    phoneNumber1 = json['phoneNumber1'];
    phoneNumber2 = json['phoneNumber2'];
    appSupportLink = json['appSupportLink'];
    supportedPaymentTypes = json['supportedPaymentTypes'] == null ? [] : List.castFrom(json['supportedPaymentTypes']);
    if (json['countries'] != null) {
      countries = <Country>[];
      json['countries'].forEach((v) {
        countries!.add(Country.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lastVersion'] = lastVersion;
    data['inStoreReview'] = inStoreReview;
    data['lastVersionUrl'] = lastVersionUrl;
    data['isUpToDate'] = isUpToDate;
    data['isAuthenticated'] = isAuthenticated;
    data['phoneNumber1'] = phoneNumber1;
    data['phoneNumber2'] = phoneNumber2;
    data['appSupportLink'] = appSupportLink;
    data['supportedPaymentTypes'] = supportedPaymentTypes;
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  fromJson(json) => InitAppEntity.fromJson(json);

  @override
  List<Object?> get props => [];
}

