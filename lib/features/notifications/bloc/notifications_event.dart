part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();
}

class GetNotificationsEvent extends NotificationsEvent {
  const GetNotificationsEvent([this.page = 0]);
  final int page;

  @override
  List<Object?> get props => [];
}
