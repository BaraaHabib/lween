import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

class RequestChangePhoneNumberParams extends ParamsModel<RequestChangePhoneNumberParamsBody> {
  RequestChangePhoneNumberParams({
    required this.phoneNumber ,
  })
      : super(body: RequestChangePhoneNumberParamsBody(),);

  late final String phoneNumber ;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.requestChangePhone;

  @override
  Map<String, String> get urlParams => {
    'phoneNumber' : phoneNumber,
  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class RequestChangePhoneNumberParamsBody extends BaseBodyModel {
  RequestChangePhoneNumberParamsBody();

  RequestChangePhoneNumberParamsBody.fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}
