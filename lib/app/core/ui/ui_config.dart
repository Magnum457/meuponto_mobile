import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiConfig {
  UiConfig._();

  static String appName = "Meu Detran";

  static ThemeData get theme => ThemeData(
        primaryColor: const Color.fromARGB(255, 106, 193, 145),
        primaryColorDark: const Color.fromARGB(255, 109, 127, 136),
        primaryColorLight: const Color.fromARGB(255, 64, 185, 140),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          displayMedium: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          titleSmall: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 64, 89, 101),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: GoogleFonts.kanit(
            color: const Color.fromARGB(
              255,
              64,
              89,
              101,
            ),
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
