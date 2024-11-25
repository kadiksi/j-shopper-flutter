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
  labelMedium: GoogleFonts.dmSans(
      fontSize: 19,
      fontWeight: FontWeight.w600,
      height: 24 / 17,
      color: lightColorScheme.onTertiary),
  labelSmall: GoogleFonts.dmSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: lightColorScheme.onTertiary),
  bodyLarge: GoogleFonts.dmSans(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 24 / 17,
    letterSpacing: -0.408,
  ),
  bodyMedium: GoogleFonts.dmSans(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 20 / 15,
      letterSpacing: -0.408,
      color: lightColorScheme.outline),
  bodySmall: GoogleFonts.dmSans(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 18 / 13,
    letterSpacing: -0.408,
  ),
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
