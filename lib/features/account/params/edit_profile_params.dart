import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

import '../../../../../../core/configurations/app_configuration.dart';

class UpdateProfileParams extends ParamsModel<UpdateProfileParamsBody> {
  UpdateProfileParams(UpdateProfileParamsBody body)
      : super(
          baseUrl: AppConfigurations.BaseUrl,
          body: body,
        );

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.editProfile;

  @override
  Map<String, dynamic> get urlParams => body.toJson();
}

class UpdateProfileParamsBody extends BaseBodyModel {
  UpdateProfileParamsBody({
    required this.name,
    required this.imageUrl,
    required this.cityId,
  });

  final String name;
  final String? imageUrl;
  final int cityId;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'imageUrl': imageUrl,
        'cityId': cityId,
      };
}
