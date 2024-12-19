import 'package:flutter/material.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

Widget buildTabWithBadge(
    BuildContext context, String title, int count, bool isSelected) {
  final theme = Theme.of(context);
  return Tab(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        divider8,
        getCount(isSelected, theme, count),
      ],
    ),
  );
}

Widget getCount(bool isSelected, ThemeData theme, int count) {
  if (count > 0) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected
            ? theme.colorScheme.secondary
            : theme.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count.toString(),
        style: TextStyle(
          color: isSelected
              ? theme.colorScheme.onSecondary
              : theme.colorScheme.surfaceTint,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  } else {
    return const SizedBox();
  }
}
