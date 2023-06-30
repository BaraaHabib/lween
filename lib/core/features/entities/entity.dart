import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:lween/core/extended/item_creator.dart';

class Entity<T> extends Equatable {
  late final ItemCreator<T>? creator;
  late final T? content;
  late final String message;
  // dynamic result;
  late final bool isApiError;
  late final bool success;
  late final int status;

  // ignore: prefer_const_constructors_in_immutables
  Entity({this.isApiError = true, this.content, this.message = '', this.success = false,this.creator,this.status = 200});

  @override
  Entity.fromJson(Map<String, dynamic> json, {this.creator,this.success = false,this.message = '',this.status = 200}) {
    // result = json['result'] ?? false;
    if (creator != null && json['content'] != null) {
      T item = creator!();
      content = (item as ContentModel).fromJson(json['content']);
    }
    status = json['status'] ?? 200;
    message = json['message'] ?? 'IDK';
    success = json['status'] == 200 ? true : false;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['result'] = this.result;
    data['content'] = this.content;
    data['message'] = this.message;
    data['status'] = this.isApiError;
    return data;
  }

  bool get unauthorized => status == 300;

  @override
  String toString() {
    return json.encode(toJson());
  }

  @override
  List<Object?> get props => [];
}


abstract class ContentModel with EquatableMixin {
  fromJson(var json);
}

class EmptyEntity extends Entity {
  @override
  List<Object?> get props => [];

  EmptyEntity();
}
