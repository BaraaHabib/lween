import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:lween/core/exceptions/app_exceptions.dart';
import 'package:lween/core/extended/item_creator.dart';

class Entity<T extends ContentModel> extends Equatable {
  late final T Function(Map<String, dynamic>)?  creator;
  late final T? content;
  late final String message;
  // dynamic result;
  late final bool isApiError;
  late final bool success;
  late final int status;

  // ignore: prefer_const_constructors_in_immutables
  Entity({this.isApiError = true, this.content, this.message = '', this.success = false,this.creator,this.status = 200});

  @override
  Entity.fromJson(Map<String, dynamic> json, {this.creator,}) {
    // result = json['result'] ?? false;
    if (creator != null) {
      // T item = creator!();
      // content = item.fromJson(json['result']);
      content = creator?.call(json['result'] ?? {});
    }
    status = json['status'] ?? 200;
    message = json['message'] ?? 'IDK';
    success = json['success'] ;
    if(!success){
      throw AppException(message,json);
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['result'] = this.result;
    data['result'] = this.content;
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

// class EmptyEntity extends Entity {
//   @override
//   List<Object?> get props => [];
//
//   EmptyEntity();
// }
class EmptyEntity extends ContentModel {
  EmptyEntity();

  @override
  List<Object?> get props => [];

  EmptyEntity.fromJson(json){}

  @override
  fromJson(json) => {};
}
