part of 'notifications_bloc.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState({this.message});
  final String? message;
}

class NotificationsInitial extends NotificationsState {
  @override
  List<Object> get props => [];
}

//#region all notifications
abstract class GetNotificationsState extends NotificationsState {
  const GetNotificationsState({String? message,required this.page}) : super(message: message);

  final int page;
}

class GetNotificationsLoading extends GetNotificationsState {
  const GetNotificationsLoading({required super.page});

  @override
  List<Object?> get props => [];
}

class GetNotificationsLoaded extends GetNotificationsState {
  const GetNotificationsLoaded({required this.notificationsResult, required super.page});

  final NotificationsEntity notificationsResult;

  @override
  List<Object> get props => [notificationsResult];
}

class GetNotificationsError extends GetNotificationsState {
  const GetNotificationsError(String message,{required int page}) : super(message: message,page: page,);
  @override
  List<Object?> get props => [message];
}
//#endregion all notifications
