import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class GreyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const GreyButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: theme.textTheme.labelSmall
              ?.copyWith(fontSize: 16, color: AppColors.blackColor),
        ),
      ),
    );
  }
}
