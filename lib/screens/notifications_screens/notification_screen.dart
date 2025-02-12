import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/blocks/notifications/notification_bloc.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/repositories/notifications/notification_abstarct_repository.dart';
import 'package:j_courier/router/router.dart';
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
  @override
  void initState() {
    _notificationBloc.add(LoadNotificationList());
    super.initState();
  }

  void goTo(Task task) {
    AutoRouter.of(context).push(AcceptedOrderTabedRoute(task: task));
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
        child: BlocBuilder<NotificationBloc, NotificationState>(
          bloc: _notificationBloc,
          builder: (context, state) {
            if (state is NotificationListSuccess) {
              return ListView.separated(
                reverse: true,
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.notifications.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.transparent,
                ),
                itemBuilder: (context, i) {
                  final task = state.notifications[i];
                  return NotificationDataTile(notification: task);
                },
              );
            }
            if (state is NotificationListFailure) {
              return FailedRequest(callback: callback);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void callback() {
    _notificationBloc.add(LoadNotificationList());
  }
}
