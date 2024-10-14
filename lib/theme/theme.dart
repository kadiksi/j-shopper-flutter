import 'package:flutter/material.dart';
import 'package:j_courier/theme/colors.dart';
import 'package:j_courier/theme/text_theme.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textTheme: lightTextStyles,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    fillColor: Colors.grey[200],
    filled: true,
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    elevation: 8.0,
    backgroundColor: lightColorScheme.tertiary,
    foregroundColor: lightColorScheme.onTertiary,
    padding: const EdgeInsets.symmetric(vertical: 26.0),
    textStyle: lightTextStyles.headlineSmall,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 8.0,
    backgroundColor: lightColorScheme.secondary,
    foregroundColor: lightColorScheme.onSecondary,
    minimumSize: const Size(200.0, 50.0),
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
    textStyle: lightTextStyles.displayLarge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  )),
);
