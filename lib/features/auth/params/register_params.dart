import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class RegisterParams extends ParamsModel<RegisterParamsBody> {
  RegisterParams({required RegisterParamsBody body})
      : super(body: body, baseUrl: AppConfigurations.BaseIdentityUrl);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => 'Patient/Register';

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class RegisterParamsBody extends BaseBodyModel {
  RegisterParamsBody({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.phoneCountryCode,
    required this.password,
    required this.countryName,
    required this.city,
    required this.street,
    required this.building,
    required this.postalCode,
    required this.enCity,
    required this.enCountryName,
    required this.deviceToken,
  });
  late final String firstName;
  late final String lastName;
  late final String phoneNumber;
  late final String phoneCountryCode;
  late final String password;
  late final String countryName;
  late final String city;
  late final String street;
  late final String building;
  late final String postalCode;
  late final String enCity;
  late final String enCountryName;
  late final String deviceToken;

  RegisterParamsBody.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    phoneCountryCode = json['phoneCountryCode'];
    password = json['password'];
    countryName = json['countryName'];
    city = json['city'];
    street = json['street'];
    building = json['building'];
    postalCode = json['postalCode'];
    enCountryName = json['enCountryName'];
    enCity = json['enCity'];
    deviceToken = json['deviceToken'] ?? '';
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['phoneCountryCode'] = phoneCountryCode;
    data['password'] = password;
    data['countryName'] = countryName;
    data['city'] = city;
    data['street'] = street;
    data['building'] = building;
    data['postalCode'] = postalCode;
    data['enCountryName'] = enCountryName;
    data['enCity'] = enCity;
    data['deviceToken'] = deviceToken;
    return data;
  }
}
