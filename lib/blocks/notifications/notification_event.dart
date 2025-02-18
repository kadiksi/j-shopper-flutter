part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {}

class LoadNotificationList extends NotificationEvent {
  LoadNotificationList({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class MarkAsReadNotification extends NotificationEvent {
  MarkAsReadNotification({this.completer, required this.notificationIds});

  final Completer? completer;
  final List<int> notificationIds;

  @override
  List<Object?> get props => [completer, notificationIds];
}
