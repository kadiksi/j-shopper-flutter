import 'package:flutter/material.dart';
import 'package:j_courier/models/notifications/user_notification.dart';
import 'package:j_courier/screens/notifications_screens/notification_tile.dart';

class NotificationDataTile extends StatelessWidget {
  const NotificationDataTile({super.key, required this.notification});

  final UserNotification notification;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: NotificationTile(notification: notification),
        ),
      ],
    );
  }
}
