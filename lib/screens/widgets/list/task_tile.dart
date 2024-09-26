import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../models/tasks/task_data_model.dart';
import '../../../router/router.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskDataModel task;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      // leading: Image.network(task.id.toString()),
      title: Text(
        task.id.toString(),
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${task.orderSource} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        AutoRouter.of(context).push(const ListRoute());
      },
    );
  }
}
