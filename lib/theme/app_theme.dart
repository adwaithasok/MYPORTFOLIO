import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Colors
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      brightness: Brightness.light,
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.spaceGrotesk(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displaySmall: GoogleFonts.spaceGrotesk(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineLarge: GoogleFonts.spaceGrotesk(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headlineMedium: GoogleFonts.roboto(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headlineSmall: GoogleFonts.spaceGrotesk(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      titleLarge: GoogleFonts.spaceGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      titleMedium: GoogleFonts.spaceGrotesk(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.spaceGrotesk(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.spaceGrotesk(
        fontSize: 16,
        color: Colors.black87,
      ),
      bodyMedium: GoogleFonts.spaceGrotesk(
        fontSize: 14,
        color: Colors.black87,
      ),
      bodySmall: GoogleFonts.spaceGrotesk(
        fontSize: 12,
        color: Colors.black87,
      ),
      labelLarge: GoogleFonts.spaceGrotesk(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      labelMedium: GoogleFonts.spaceGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      labelSmall: GoogleFonts.spaceGrotesk(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),

    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.spaceGrotesk(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.spaceGrotesk(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        side: const BorderSide(color: Colors.black),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.spaceGrotesk(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    ),
  );
}
