import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/blocks/notifications/notification_bloc.dart';
import 'package:j_courier/models/notifications/user_notification.dart';
import 'package:j_courier/repositories/notifications/notification_abstarct_repository.dart';
import 'package:j_courier/screens/notifications_screens/notification_data_tile.dart';
import 'package:j_courier/screens/widgets/errors/failed_request.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final _notificationBloc = NotificationBloc(
    GetIt.I<NotificationAbstractRepository>(),
  );

  List<int> selectedItems = [];
  List<UserNotification> notifications = [];

  @override
  void initState() {
    _notificationBloc.add(LoadNotificationList());
    super.initState();
  }

  void markAsRead(List<UserNotification> notifications) {
    _notificationBloc
        .add(MarkAsReadNotification(notificationIds: getIds(notifications)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F5),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _notificationBloc.add(LoadNotificationList(completer: completer));
          return completer.future;
        },
        child: BlocConsumer<NotificationBloc, NotificationState>(
          bloc: _notificationBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is NotificationListSuccess) {
              notifications.addAll(state.notifications);
              markAsRead(state.notifications);
            }
            if (state is NotificationListFailure) {
              return FailedRequest(callback: callback);
            }

            return list(notifications);
            // return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void callback() {
    _notificationBloc.add(LoadNotificationList());
  }
}

Widget list(List<UserNotification> notifications) {
  return ListView.separated(
    reverse: true,
    padding: const EdgeInsets.only(top: 16),
    itemCount: notifications.length,
    separatorBuilder: (context, index) => const Divider(
      color: Colors.transparent,
    ),
    itemBuilder: (context, i) {
      final task = notifications[i];
      return NotificationDataTile(notification: task);
    },
  );
}
