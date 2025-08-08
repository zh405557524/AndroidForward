import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      primarySwatch: Colors.teal,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ));

  static ThemeData dark = ThemeData(
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      )
  );
}
