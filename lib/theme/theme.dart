import 'package:flutter/material.dart';

class DoDidDoneTheme {
  static ThemeData lightTheme = ThemeData(
    // Define your primary and secondary colorsLoginScreen
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9F7BF6), // Primary color
      secondary: const Color(0xFF4CEB8B), // Secondary color
    ),
    useMaterial3: true,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    // Define your primary and secondary colors
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9F7BF6), // Primary color
      secondary: const Color(0xFF4CEB8B), // Secondary color
    ),
    useMaterial3: true,
    brightness: Brightness.dark,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFF9f7bf6), // Цвет выбранной иконки
      unselectedItemColor:
          Color(0xFF4ceb8b), // Цвет невыбранной иконки
      backgroundColor: Colors.transparent, // Прозрачный фон
      // Убираем тень
          ),
            // ),
  );
}
