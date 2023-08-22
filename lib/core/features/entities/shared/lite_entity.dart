


import 'package:lween/core/features/entities/entity.dart';

class LiteEntity extends ContentModel{



  int? id;
  String? text;

  LiteEntity.fromJson(json) {
    id = json['id'];
    text = json['text'];
  }

  @override
  fromJson(json) => LiteEntity.fromJson(json);

  @override
  List<Object?> get props => [id,text,];

  LiteEntity(this.id, this.text);
}