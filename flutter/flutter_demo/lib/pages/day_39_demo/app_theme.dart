import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ));
  static ThemeData dark = ThemeData(
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ));
}
