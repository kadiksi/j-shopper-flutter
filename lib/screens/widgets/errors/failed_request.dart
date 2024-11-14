import 'package:flutter/material.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

class FailedRequest extends StatelessWidget {
  const FailedRequest({super.key, required this.callback});

  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Something went wrong',
            style: theme.textTheme.headlineMedium,
          ),
          Text(
            'Please try againg later',
            style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
          ),
          divider30,
          TextButton(
            onPressed: () {
              callback();
            },
            child: const Text('Try againg'),
          ),
        ],
      ),
    );
  }
}
