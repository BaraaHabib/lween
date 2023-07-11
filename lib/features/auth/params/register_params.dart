import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class RegisterParams extends ParamsModel<RegisterParamsBody> {
  RegisterParams({required RegisterParamsBody body})
      : super(body: body,);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.register;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class RegisterParamsBody extends BaseBodyModel {
  RegisterParamsBody({
    required this.name,
    this.gender,
    required this.cityId,
    required this.phoneNumber,
    this.emailAddress,
    required this.password,
    required this.confirmPassword,
  });
  late final String name;
  late final int? gender;
  late final int cityId;
  late final String phoneNumber;
  late final String? emailAddress;
  late final String password;
  late final String confirmPassword;

  RegisterParamsBody.fromJson(Map<String, dynamic> json){
    name = json['name'];
    gender = json['gender'];
    cityId = json['cityId'];
    phoneNumber = json['phoneNumber'];
    emailAddress = json['emailAddress'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['gender'] = gender;
    data['cityId'] = cityId;
    data['phoneNumber'] = phoneNumber;
    data['emailAddress'] = emailAddress;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    return data;
  }
}
