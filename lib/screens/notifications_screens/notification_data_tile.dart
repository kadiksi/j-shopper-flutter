import 'package:flutter/material.dart';
import 'package:j_courier/models/notifications/user_notification.dart';
import 'package:j_courier/screens/notifications_screens/notification_tile.dart';

class NotificationDataTile extends StatelessWidget {
  const NotificationDataTile({super.key, required this.notification});

  final UserNotification notification;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String date = notification.createdDate!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 8, bottom: 8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Text(
                  date,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: NotificationTile(notification: notification),
        ),
      ],
    );
  }
}
