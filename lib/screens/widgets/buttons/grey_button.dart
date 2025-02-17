import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const GreyButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          child: Text(label, style: GoogleFonts.notoSans()),
        ));
  }
}
