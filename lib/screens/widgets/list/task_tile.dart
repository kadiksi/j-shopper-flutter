import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

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
    final isSelected = selectedItems.contains(task.externalOrderId);
    return GestureDetector(
        onLongPress: () {
          if (selectedItems.isEmpty) {
            setState(() {
              selectedItems.add(task.externalOrderId! as int);
            });
          }
        },
        onTap: () {
          if (selectedItems.isNotEmpty) {
            setState(() {
              if (isSelected) {
                selectedItems.remove(task.externalOrderId);
              } else {
                selectedItems.add(task.externalOrderId! as int);
              }
            });
          } else {
            goTo(task);
          }
        },
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
                '№ ${task.externalOrderId}',
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
                      '${task.plannedDateInterval}',
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
                      S.of(context).positions('${task.totalProductAmount}'),
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(color: theme.colorScheme.surfaceTint),
                    ),
                    divider8,
                    Text('${task.totalPrice}',
                        style: theme.textTheme.headlineMedium),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${task.customerCityName}',
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(color: theme.colorScheme.surfaceTint),
                    ),
                    divider8,
                    Text(S.of(context).createddate((task.plannedDate ?? ' ')),
                        style: theme.textTheme.headlineSmall),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
