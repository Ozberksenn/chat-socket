import 'package:flutter/material.dart';

ThemeData customDarkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.transparent,
    useMaterial3: false,
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: Colors.grey.shade600),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        bodyLarge: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400)));
