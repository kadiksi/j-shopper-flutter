import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/models/notifications/user_notification.dart';
import 'package:j_courier/repositories/notifications/notification_abstarct_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../models/ApiResponse';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(this.notificationRepository) : super(NotificationInitial()) {
    on<LoadNotificationList>(_loadNotifications);
    on<MarkAsReadNotification>(_markAsRead);
  }

  final NotificationAbstractRepository notificationRepository;

  Future<void> _loadNotifications(
    LoadNotificationList event,
    Emitter<NotificationState> emit,
  ) async {
    if (state is! NotificationListSuccess) {
      emit(NotificationListLoading());
    }
    final response = await notificationRepository.getNotificationList();

    if (response is SuccessResponse<List<UserNotification>>) {
      emit(NotificationListSuccess(notifications: response.data));
    } else if (response is ErrorResponse) {
      emit(NotificationListFailure(exception: response.errorMessage));
    }
  }

  Future<void> _markAsRead(
    MarkAsReadNotification event,
    Emitter<NotificationState> emit,
  ) async {
    // if (state is! NotificationListSuccess) {
    //   emit(NotificationListLoading());
    // }
    final response =
        await notificationRepository.markAsRead(event.notificationIds);

    if (response is SuccessResponse<String>) {
      emit(NotificationMarkAsReadSuccess(data: response.data));
    } else if (response is ErrorResponse) {
      emit(NotificationMarkAsReadFailure(exception: response.errorMessage));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
