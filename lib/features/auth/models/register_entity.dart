import 'package:lween/core/features/entities/entity.dart';

class RegisterEntity extends ContentModel {
  RegisterEntity({
    required this.id,
    required this.text,
  });
  late final int id;
  late final String text;

  RegisterEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    return data;
  }

  @override
  fromJson(json) => RegisterEntity.fromJson(json);

  @override
  List<Object?> get props => [id, text,];

}
