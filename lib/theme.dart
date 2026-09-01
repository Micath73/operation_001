import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Marian Blue & Liturgical Gold Palette Tokens
  static const Color marianBlueLight = Color(0xFF2E5C8A);
  static const Color marianBlueDark = Color(0xFF6FA3D6);
  static const Color softGoldLight = Color(0xFFC9A959);
  static const Color softGoldDark = Color(0xFFD4B76A);

  static const Color sacramentalCream = Color(0xFFF9F7F2);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCard = Color(0xFF252525);

  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textLight = Color(0xFFE8E6E1);
  static const Color textMutedLight = Color(0xFF757575);
  static const Color textMutedDark = Color(0xFFA0A0A0);

  // Unified Text Theme with English & Amharic Font Fallbacks
  static TextTheme _buildTextTheme(Color bodyColor, Color headlineColor) {
    final List<String> fontFallbacks = [
      GoogleFonts.notoSerifEthiopic().fontFamily!,
      GoogleFonts.abyssinicaSil().fontFamily!,
    ];

    return TextTheme(
      displayLarge: GoogleFonts.notoSerif(
        textStyle: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          height: 1.2,
          color: headlineColor,
          fontFamilyFallback: fontFallbacks,
        ),
      ),
      headlineLarge: GoogleFonts.notoSerif(
        textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 1.3,
          color: headlineColor,
          fontFamilyFallback: fontFallbacks,
        ),
      ),
      titleLarge: GoogleFonts.notoSerif(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          height: 1.4,
          color: headlineColor,
          fontFamilyFallback: fontFallbacks,
        ),
      ),
      bodyLarge: GoogleFonts.notoSerif(
        textStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          height: 1.6,
          color: bodyColor,
          fontFamilyFallback: fontFallbacks,
        ),
      ),
      bodyMedium: GoogleFonts.notoSerif(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.6,
          color: bodyColor,
          fontFamilyFallback: fontFallbacks,
        ),
      ),
      labelSmall: GoogleFonts.notoSans(
        textStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: bodyColor.withAlpha(178),
          fontFamilyFallback: fontFallbacks,
        ),
      ),
    );
  }

  // --- LIGHT THEME ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: marianBlueLight,
      onPrimary: Colors.white,
      secondary: softGoldLight,
      onSecondary: textDark,
      surface: sacramentalCream,
      surfaceContainerHighest: Colors.white,
      onSurface: textDark,
      onSurfaceVariant: textMutedLight,
      outline: Color(0xFFB0B5BD),
    ),
    textTheme: _buildTextTheme(textDark, marianBlueLight),
    appBarTheme: const AppBarTheme(
      backgroundColor: marianBlueLight,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    cardTheme: CardThemeData(
      color: sacramentalCream,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE0DCD3), width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: marianBlueLight,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.notoSerif(
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 2,
      ),
    ),
    splashColor: marianBlueLight.withAlpha(26),
    highlightColor: marianBlueLight.withAlpha(13),
  );

  // --- DARK THEME ---
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: marianBlueDark,
      onPrimary: Color(0xFF0D1B2A),
      secondary: softGoldDark,
      onSecondary: Color(0xFF0D1B2A),
      surface: darkSurface,
      surfaceContainerHighest: darkCard,
      onSurface: textLight,
      onSurfaceVariant: textMutedDark,
      outline: Color(0xFF4A4F57),
    ),
    textTheme: _buildTextTheme(textLight, textLight),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackground,
      foregroundColor: textLight,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: marianBlueDark),
    ),
    cardTheme: CardThemeData(
      color: darkCard,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: marianBlueDark.withAlpha(38), width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: marianBlueDark,
        foregroundColor: const Color(0xFF0D1B2A),
        textStyle: GoogleFonts.notoSerif(
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 4,
      ),
    ),
    splashColor: marianBlueDark.withAlpha(51),
    highlightColor: marianBlueDark.withAlpha(26),
  );
}