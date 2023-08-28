import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

class DeleteAccountParams extends ParamsModel<DeleteAccountParamsBody> {
  DeleteAccountParams({required DeleteAccountParamsBody body})
      : super(body: body,);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.DELETE;

  @override
  String? get url => ApiConstants.deleteAccount;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class DeleteAccountParamsBody extends BaseBodyModel {
  DeleteAccountParamsBody({
    required this.password,
  });
  late final String password;

  DeleteAccountParamsBody.fromJson(Map<String, dynamic> json){
    password = json['password'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['password'] = password;
    return data;
  }
}
