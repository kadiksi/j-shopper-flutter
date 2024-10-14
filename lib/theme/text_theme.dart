import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:j_courier/theme/colors.dart';

final lightTextStyles = TextTheme(
  headlineLarge: GoogleFonts.dmSans(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: lightColorScheme.outline),
  headlineMedium: GoogleFonts.dmSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: lightColorScheme.outline),
  headlineSmall: GoogleFonts.dmSans(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: lightColorScheme.outline),
  labelSmall: GoogleFonts.dmSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: lightColorScheme.onTertiary),
);

final darkTextStyles = TextTheme(
  displayLarge: TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
      color: lightColorScheme.onTertiary),
  titleLarge: GoogleFonts.oswald(
    fontSize: 30,
    fontStyle: FontStyle.italic,
  ),
  bodyMedium: GoogleFonts.merriweather(),
  displaySmall: GoogleFonts.dmSans(),
);
