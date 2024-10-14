import 'package:flutter/material.dart';

class GreyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const GreyButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          child: Text(label),
        ));
    return SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          child: Text(label),
        ));
  }
}
