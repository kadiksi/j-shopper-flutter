part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {}

class LoadNotificationList extends NotificationEvent {
  LoadNotificationList({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
