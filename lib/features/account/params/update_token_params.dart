import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

class UpdateTokenParams extends ParamsModel<UpdateTokenParamsBody> {
  UpdateTokenParams({required UpdateTokenParamsBody body})
      : super(body: body,);
  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.updateToken;

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

class UpdateTokenParamsBody extends BaseBodyModel {
  UpdateTokenParamsBody({
    this.oldToken,
    this.newToken,
    this.isLogingOut = false,
  });
  late final String? oldToken;
  late final String? newToken;
  late final bool isLogingOut;

  UpdateTokenParamsBody.fromJson(Map<String, dynamic> json){
    oldToken = json['oldToken'];
    newToken = json['newToken'];
    isLogingOut = json['isLogingOut'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['oldToken'] = oldToken;
    data['newToken'] = newToken;
    data['isLogingOut'] = isLogingOut;
    return data;
  }
}
