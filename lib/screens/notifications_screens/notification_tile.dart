import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:j_courier/models/notifications/user_notification.dart';

import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.notification});

  final UserNotification notification;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.all(16),
          child: const Icon(
            Icons.person,
            color: Colors.blue,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${notification.userId}',
                        style: theme.textTheme.bodyMedium,
                      ),
                      divider4,
                      Text(
                        "№${notification.id}",
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      divider4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Курьер: ${notification.title?.RU} ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            (notification.createdDate!),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ]),
              Positioned(
                right: -4,
                top: -4,
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset(
                    'assets/svg/notification_badg.svg',
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
