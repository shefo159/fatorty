import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define your theme data here
// Light Theme
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.red,
    colorScheme: ColorScheme.light(
      primary: Colors.indigo,
      secondary: Colors.indigo.shade100,
      surface: Colors.white,
      inverseSurface: Colors.black,
      background: Colors.grey[50]!,
      error: Colors.red,
    ),
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(6),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.lexend(fontSize: 16, color: Colors.black87),
      bodyMedium: GoogleFonts.lexend(fontSize: 14, color: Colors.black54),
      bodySmall: GoogleFonts.lexend(fontSize: 12, color: Colors.black54),
      headlineSmall: GoogleFonts.lexend(fontSize: 22, color: Colors.indigoAccent, fontWeight: FontWeight.w600),
      titleLarge: GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
      titleMedium: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black87),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.red,
    colorScheme: ColorScheme.dark(
      primary: Colors.indigo.shade200,
      secondary: Colors.indigo.shade700,
      surface: Colors.grey[900]!,
      inverseSurface: Colors.white,
      background: Colors.grey[850]!,
      error: Colors.red.shade400,
    ),
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.indigo.shade700,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(6),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.lexend(fontSize: 16, color: Colors.white70),
      bodyMedium: GoogleFonts.lexend(fontSize: 14, color: Colors.white60),
      bodySmall: GoogleFonts.lexend(fontSize: 12, color: Colors.white60),
      headlineSmall: GoogleFonts.lexend(
          fontSize: 22,
          color: Colors.indigo.shade200,
          fontWeight: FontWeight.w600),
      titleLarge: GoogleFonts.lexend(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      titleMedium: GoogleFonts.lexend(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white70),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo.shade400,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}