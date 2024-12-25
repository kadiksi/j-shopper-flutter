import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

Widget buildOrderInfo(BuildContext context, ThemeData theme, Task task) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${task.customerName}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.orange),
                const SizedBox(width: 4),
                Text('${task.plannedDateInterval}',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        divider4,
        Text('Плановая дата ${'${task.plannedDate}'}',
            style: TextStyle(color: Colors.grey[600])),
        divider8,
        GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).call,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    ),
  );
}
