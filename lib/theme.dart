
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// THEME COLORS
const Color kPrimaryColor = Color(0xFF121212); // Deep Black
const Color kAccentColor = Color(0xFFFFD700); // Gold
const Color kTextColor = Colors.white;
const Color kTextSecondaryColor = Colors.white70;
ThemeData get kDarkTheme {
  return ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: kTextColor, displayColor: kTextColor),
        colorScheme: const ColorScheme.dark(
          primary: kPrimaryColor,
          secondary: kAccentColor,
          onPrimary: kTextColor,
          onSecondary: kTextColor,
        ),
      );
}