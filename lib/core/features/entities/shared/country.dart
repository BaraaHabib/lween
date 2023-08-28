import 'city.dart';
class Country {
  int? id;
  String? name;
  String? dialCode;
  List<City>? cities;

  Country({this.id, this.name, this.dialCode, this.cities});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dialCode = json['dialCode'];
    if (json['cities'] != null) {
      cities = <City>[];
      json['cities'].forEach((v) {
        cities!.add(City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['dialCode'] = dialCode;
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
