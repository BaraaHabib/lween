import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/shared/country.dart';

class InitAppEntity extends ContentModel {
  String? lastVersion;
  String? lastVersionUrl;
  bool? isUpToDate;
  bool? isAuthenticated;
  String? phoneNumber1;
  String? phoneNumber2;
  List<Country>? countries;

  InitAppEntity(
      {this.lastVersion,
        this.lastVersionUrl,
        this.isUpToDate,
        this.isAuthenticated,
        this.phoneNumber1,
        this.phoneNumber2,
        this.countries});

  InitAppEntity.fromJson(json) {
    lastVersion = json['lastVersion'];
    lastVersionUrl = json['lastVersionUrl'];
    isUpToDate = json['isUpToDate'];
    isAuthenticated = json['isAuthenticated'];
    phoneNumber1 = json['phoneNumber1'];
    phoneNumber2 = json['phoneNumber2'];
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
    data['lastVersionUrl'] = lastVersionUrl;
    data['isUpToDate'] = isUpToDate;
    data['isAuthenticated'] = isAuthenticated;
    data['phoneNumber1'] = phoneNumber1;
    data['phoneNumber2'] = phoneNumber2;
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

