import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeraTheme {
  static const Color darkBg = Color(0xFF05060A);
  static const Color darkBlueBg = Color(0xFF0A0F1F);
  static const Color neonPurple = Color(0xFFA855F7);
  static const Color neonPurpleLight = Color(0xFFC084FC);
  static const Color neonBlue = Color(0xFF3B82F6);
  static const Color neonCyan = Color(0xFF22D3EE);
  static const Color metallicSilver = Color(0xFFE5E7EB);
  static const Color metallicGrey = Color(0xFFC0C7D1);
  static const Color glowPurple = Color.fromRGBO(168, 85, 247, 0.6);
  static const Color glowBlue = Color.fromRGBO(59, 130, 246, 0.6);

  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBg,
      primaryColor: neonPurple,
      colorScheme: ColorScheme.dark(
        primary: neonPurple,
        secondary: neonBlue,
        surface: darkBlueBg,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
      ),
      textTheme: GoogleFonts.exo2TextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.orbitron(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
        headlineMedium: GoogleFonts.orbitron(
          color: neonPurpleLight,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
        bodyLarge: GoogleFonts.exo2(
          color: Colors.white,
          letterSpacing: 1.2,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: neonPurple,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.orbitron(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 10,
          shadowColor: glowPurple,
        ),
      ),
    );
  }

  static BoxDecoration metallicGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: [metallicSilver, metallicGrey],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static BoxDecoration neonGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: [neonPurple, neonBlue],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}
