part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {}

class NotificationInitial extends NotificationState {
  @override
  List<Object?> get props => [];
}

class NotificationListLoading extends NotificationState {
  @override
  List<Object?> get props => [];
}

class NotificationListSuccess extends NotificationState {
  NotificationListSuccess({
    required this.notifications,
  });

  final List<UserNotification> notifications;

  @override
  List<Object?> get props => [notifications];
}

class NotificationListFailure extends NotificationState {
  NotificationListFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class NotificationMarkAsReadSuccess extends NotificationState {
  NotificationMarkAsReadSuccess({
    required this.data,
  });

  final String data;

  @override
  List<Object?> get props => [data];
}

class NotificationMarkAsReadFailure extends NotificationState {
  NotificationMarkAsReadFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
