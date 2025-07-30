import 'package:flutter/material.dart';

final ThemeData whiteTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF808080),
    foregroundColor: Colors.white, 
    elevation: 0,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.grey,
    secondary: Colors.grey.shade600,
  ),
  textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
);
