import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsWidget extends StatelessWidget {
  final String icon;
  final String label;
  final Widget trailingWdget;
  final VoidCallback onTap;

  const SettingsWidget({
    required this.icon,
    required this.label,
    required this.trailingWdget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          icon,
          width: 28,
          height: 28,
        ),
        // Icon(Icons.translate, color: theme.colorScheme.secondary),
        title: Text(
          label,
          style: theme.textTheme.bodyMedium,
        ),
        trailing: trailingWdget,
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
