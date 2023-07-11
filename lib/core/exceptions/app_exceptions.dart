import 'package:equatable/equatable.dart';
import 'package:lween/generated/l10n.dart';

class AppException extends Equatable implements Exception {
  const AppException([ this._message = '',this.data,]);

  final String _message;
  String get message => _message;
  final Map? data;

  @override
  String toString() {
    return _message;
  }

  @override
  List<Object?> get props => [_message, data];
}

class FetchDataException extends AppException {
  FetchDataException({String? message, data})
      : super(message = message ?? 'Unknown Error',data, );
}

class NoInternetException extends AppException {
  NoInternetException({String? message, data})
      : super(message = S.current.noInternetConnection,data,);
}

class NoItemsException extends AppException {
  NoItemsException({String? message, data}) : super(message = 'No Items',data,);
}

class BadRequestException extends AppException {
  final int code;

  BadRequestException({String? message, data, required this.code})
      : super( message = 'Bad Request',data,);
}

class UnauthorisedException extends AppException {
  UnauthorisedException({String? message, data})
      : super( message = 'Unauthorised',data,);
}

class NotFoundException extends AppException {
  NotFoundException({String? message, data})
      : super( message = 'NotFound',data,);
}

class InvalidInputException extends AppException {
  InvalidInputException({String? message, data})
      : super( message = message ?? 'Invalid Input',data,);
}

class ServerErrorException extends AppException {
  ServerErrorException({String? message, data})
      : super( message = 'Server Error',data,);
}

class CacheException extends AppException {
  CacheException({String? message, data}) : super( message = 'Cash Error',data,);
}

class SessionTimedOutException extends AppException {
  SessionTimedOutException({String? message, data})
      : super( message = 'Session Timed Out',data,);
}

class NotImplementedException extends AppException {
  const NotImplementedException({String? message, data})
      : super( "$message 'Not implemented'}",data,);
}
