import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/injection_container.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class VerifyAccountParams extends ParamsModel<VerifyAccountParamsBody> {
  VerifyAccountParams({required VerifyAccountParamsBody body})
      : super(body: body,);
  @override
  Map<String, String> get additionalHeaders => {
    'deviceType': sl<AppStateModel>().deviceType.toString()
  };

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.verifyAccount;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class VerifyAccountParamsBody extends BaseBodyModel {
  VerifyAccountParamsBody({
    required this.accountId,
    required this.confirmationCode,
  });
  late final int accountId;
  late final String confirmationCode;

  VerifyAccountParamsBody.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    confirmationCode = json['confirmationCode'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = accountId;
    data['confirmationCode'] = confirmationCode;
    data['deviceType'] = sl<AppStateModel>().deviceType.toString();
    return data;
  }
}
