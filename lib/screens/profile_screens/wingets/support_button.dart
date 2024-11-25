import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

class SupportButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const SupportButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 28,
              height: 28,
            ),
            divider8,
            Text(
              label,
              style: theme.textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
