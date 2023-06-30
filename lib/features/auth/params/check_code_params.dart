import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/constants.dart';

class CheckCodeParams extends ParamsModel<CheckCodeParamsBody> {
  CheckCodeParams({required CheckCodeParamsBody body})
      : super(body: body, baseUrl: AppConfigurations.BaseUrl);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => 'Patient/CheckCode';

  @override
  bool get authorized => false;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class CheckCodeParamsBody extends BaseBodyModel {
  CheckCodeParamsBody({
    this.phoneNumber,
    this.code
  });
  final String? phoneNumber;
  final String? code;

  @override
  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'code': code,
      };
}
