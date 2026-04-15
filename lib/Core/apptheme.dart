import 'package:flutter/material.dart';

class AppTheme {
  // ================= COLORS =================

  // Brand
  static const Color primary = Color(0xFF3327AE); // rgb(51,39,174)
  static const Color primaryDark = Color(0xFF281F8A);
  static const Color primarySoft = Color(0xFFE4E2FA);

  // Light colors
  static const Color lightBg = Color(0xFFFFFFFF);
  static const Color lightSecondaryBg = Color(0xFFF5F5F5); // smoke white
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightDivider = Color(0xFFE6E6E6);

  static const Color lightTextPrimary = Color(0xFF111111);
  static const Color lightTextSecondary = Color(0xFF555555);
  static const Color lightHint = Color(0xFF9E9E9E);
  static const Color lightDisabled = Color(0xFFBDBDBD);

  // Dark colors
  static const Color darkBg = Color(0xFF000000);
  static const Color darkSecondaryBg = Color(0xFF121212);
  static const Color darkCard = Color(0xFF1E1E1E); // light black
  static const Color darkDivider = Color(0xFF2A2A2A);

  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB3B3B3);
  static const Color darkHint = Color(0xFF7A7A7A);
  static const Color darkDisabled = Color(0xFF5C5C5C);

  // ================= LIGHT THEME =================

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Inter",
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: lightSecondaryBg,
    dividerColor: lightDivider,

    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: primarySoft,
      background: lightBg,
      surface: lightCard,
      onPrimary: Colors.white,
      onBackground: lightTextPrimary,
      onSurface: lightTextPrimary,
      error: Color(0xFFD32F2F),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    cardTheme: CardThemeData(
      color: lightCard,
      elevation: 3,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    iconTheme: const IconThemeData(
      color: primary,
      size: 22,
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: lightTextPrimary),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: lightTextPrimary),
      bodyLarge: TextStyle(fontSize: 14, color: lightTextPrimary),
      bodyMedium: TextStyle(fontSize: 13, color: lightTextSecondary),
      bodySmall: TextStyle(fontSize: 12, color: lightHint),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        side: const BorderSide(color: primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightBg,
      hintStyle: const TextStyle(color: lightHint),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: lightDivider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: lightDivider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: primary, width: 1.8),
      ),
    ),
  );

  // ================= DARK THEME =================

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Inter",
    brightness: Brightness.dark,
    primaryColor: primary,
    scaffoldBackgroundColor: darkBg,
    dividerColor: darkDivider,

    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: primarySoft,
      background: darkBg,
      surface: darkCard,
      onPrimary: Colors.white,
      onBackground: darkTextPrimary,
      onSurface: darkTextPrimary,
      error: Color(0xFFD32F2F),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    cardTheme: CardThemeData(
      color: darkCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 22,
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: darkTextPrimary),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: darkTextPrimary),
      bodyLarge: TextStyle(fontSize: 14, color: darkTextPrimary),
      bodyMedium: TextStyle(fontSize: 13, color: darkTextSecondary),
      bodySmall: TextStyle(fontSize: 12, color: darkHint),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkCard,
      hintStyle: const TextStyle(color: darkHint),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: darkDivider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: darkDivider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: primary, width: 1.8),
      ),
    ),
  );
}
