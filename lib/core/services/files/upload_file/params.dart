

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/resources/api_consts.dart';
import 'package:lween/core/resources/constants.dart';

class UploadFileParams extends ParamsModel<UploadFileParamsBody>{

  final int fileType;

  UploadFileParams(this.fileType, {required super.body});

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.POST;

  @override
  String? get url => ApiConstants.uploadFile;

  @override
  bool get authorized => true;

  @override
  bool get isFormData => true;

  @override
  Map<String, String> get urlParams => {
    'fileType' : fileType.toString(),
  };

  @override
  List<Object?> get props => [url, urlParams, requestType, body];

}

class UploadFileParamsBody extends BaseBodyModel{

  final String filePath;

  UploadFileParamsBody({required this.filePath});

  @override
  Map<String, dynamic> toJson() => {
    'file' : MultipartFile.fromFileSync(filePath)
  };

}