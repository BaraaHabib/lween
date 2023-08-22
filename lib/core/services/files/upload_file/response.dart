

import 'package:lween/core/features/entities/entity.dart';

class FileUploadEntity extends ContentModel {
  FileUploadEntity({this.fileId, this.url});

  final String? fileId;
  final String? url;
  @override
  List<Object?> get props => [];

  factory FileUploadEntity.fromJson(json) {
    return FileUploadEntity(
      fileId: json['fileId'],
      url: json['url'],
    );
  }


  @override
  fromJson(json) => FileUploadEntity.fromJson(json);
}
