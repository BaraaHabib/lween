
// ignore_for_file: must_be_immutable

import 'package:lween/core/exceptions/app_exceptions.dart';
import 'package:lween/core/features/entities/entity.dart';

class ErrorEntity extends Entity {
  ErrorEntity(
      {this.code,
      required this.errorMessage,
      this.details,
      this.validationErrors});

  factory ErrorEntity.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson['error_description'] != null) {
      var error = parsedJson['error_description'];
      var res = ErrorEntity(errorMessage: error);
      if (error is List && error.isNotEmpty) {
        for (int i = 0; i < error.length; i++) {
          res.validationErrors?.add(error[i]);
        }
      }
      return ErrorEntity(errorMessage: error);
    }
    return ErrorEntity(errorMessage: 'Unknown Error');
  }

  factory ErrorEntity.fromAppException(AppException exception) {
    return ErrorEntity(errorMessage: exception.message);
    // errorMessage = exception.message;
  }
  factory ErrorEntity.fromException(Exception exception) {
    return ErrorEntity(errorMessage: exception.toString());
    // errorMessage = exception.message;
  }

  int? code;
  String errorMessage;
  String? details;
  List<String>? validationErrors = [];


  @override
  List<Object?> get props => [code,errorMessage,];
}
