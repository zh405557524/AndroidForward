import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.blue,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(bodyLarge: TextStyle(fontSize: 18, color: Colors.black)));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black, foregroundColor: Colors.white),
      textTheme: const TextTheme(bodyLarge: TextStyle(fontSize: 18, color: Colors.white70)));
}
