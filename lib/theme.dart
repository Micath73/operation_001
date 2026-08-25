import 'package:flutter/material.dart';

class AppTheme {
  // Liturgical Violet & Sacred Amber Palette
  static const Color primaryLight = Color(0xFF4A2574);
  static const Color accentGold = Color(0xFFD4AF37);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primaryLight,
      secondary: accentGold,
      surface: Color(0xFFFFFFFF),
      background: Color(0xFFF9F8F6),
      onPrimary: Colors.white,
      onSurface: Color(0xFF1C1B1F),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryLight,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFC3A3ED),
      secondary: Color(0xFFE5C158),
      surface: Color(0xFF1E1E1E),
      background: Color(0xFF121212),
      onPrimary: Color(0xFF38006B),
      onSurface: Color(0xFFE6E1E5),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Color(0xFFE6E1E5),
      elevation: 0,
    ),
  );
}
