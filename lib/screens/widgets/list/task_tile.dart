import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';
import 'package:j_courier/utils/date_utils.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.selectedItems,
    required this.setState,
    required this.goTo,
  });

  final Task task;
  final List<int> selectedItems;
  final void Function(VoidCallback fn) setState;

  final Function(Task) goTo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = selectedItems.contains(task.id);
    return GestureDetector(
        onLongPress: () {
          if (selectedItems.isEmpty) {
            setState(() {
              selectedItems.add(task.id);
            });
          }
        },
        onTap: () {
          if (selectedItems.isNotEmpty) {
            setState(() {
              if (isSelected) {
                selectedItems.remove(task.id);
              } else {
                selectedItems.add(task.id);
              }
            });
          } else {
            // AutoRouter.of(context).push(OrderRoute(task: task));
            goTo(task);
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
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/tabs/clock_active.svg",
                    ),
                    divider4,
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
                    divider8,
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
                    divider8,
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
