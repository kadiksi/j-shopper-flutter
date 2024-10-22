import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/utils/date_utils.dart';
import '../../../router/router.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      required this.task,
      required this.selectedItems,
      required this.setState});

  final Task task;
  final List<int> selectedItems;
  final void Function(VoidCallback fn) setState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = selectedItems.contains(task.id);
    return GestureDetector(
        onLongPress: () {
          if (selectedItems.length == 0) {
            setState(() {
              selectedItems.add(task.id);
            });
          }
        },
        onTap: () {
          if (selectedItems.length != 0) {
            setState(() {
              if (isSelected) {
                selectedItems.remove(task.id);
              } else {
                selectedItems.add(task.id);
              }
            });
          } else {
            AutoRouter.of(context).push(OrderRoute(task: task));
          }
        },
        // margin: const EdgeInsets.only(
        //     left: 16, right: 16, bottom: 0),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          tileColor: Colors.grey.shade200,
          contentPadding:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          leading: Icon(
            Icons.check_circle,
            color: isSelected ? Colors.lightGreenAccent : null,
          ),
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
                      '${task.createdDate?.day}',
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
                      S.of(context).positions(task.orderSource as String),
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
                    Text(
                        S.of(context).createddate(
                            formatFromDateToddMMyyyy(task.createdDate!)),
                        style: theme.textTheme.headlineMedium),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
