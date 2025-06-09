import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFFBFFF00);
  static const Color darkGrey = Color(0xFF2C2C2C);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: darkGrey,
    primaryColor: primaryGreen,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 20),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white12,
      border: OutlineInputBorder(),
      hintStyle: TextStyle(color: Colors.white54),
    ),
    fontFamily: 'Poppins',
  );
}