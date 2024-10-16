import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:j_courier/generated/l10n.dart';
import '../../../models/tasks/task_data_model.dart';
import '../../../router/router.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });
  final TaskDataModel task;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        margin: const EdgeInsets.only(
            left: 16, right: 16, bottom: 0), // Adding margin around the tile
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          tileColor: Colors.grey.shade200,
          contentPadding:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '№ ${task.id}',
                style: theme.textTheme.bodyLarge,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE9D4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/tabs/clock_active.svg",
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${task.createdDate.day}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).positions(task.orderSource),
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(color: theme.colorScheme.surfaceTint),
                    ),
                    const SizedBox(height: 8),
                    Text(' 100 тг', style: theme.textTheme.headlineMedium),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'location',
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(color: theme.colorScheme.surfaceTint),
                    ),
                    const SizedBox(height: 8),
                    Text(S.of(context).createddate(task.getcreatedDate()),
                        style: theme.textTheme.headlineMedium),
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            AutoRouter.of(context).push(const ListRoute());
          },
        ));
  }
}
