import 'package:flutter/material.dart';

class ActionLabelWidget extends StatelessWidget {
  final String label;

  const ActionLabelWidget({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(width: 8),
        const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      ],
    );
  }
}
