import 'package:flutter/material.dart';

class AppTheme {
  // ================= CORE BRAND COLORS =================

  /// Main emergency/disaster theme
  static const Color primary = Color.fromARGB(
    255,
    149,
    16,
    4,
  ); // Emergency Orange
  static const Color primaryDark = Color(0xFFC43E00);
  static const Color primarySoft = Color(0xFFFFE0CC);

  /// Accent
  static const Color accent = Color(0xFF1565C0); // Rescue Blue
  static const Color accentSoft = Color(0xFFD6E8FF);

  /// Severity Colors
  static const Color severe = Color(0xFFD32F2F);
  static const Color moderate = Color(0xFFFF9800);
  static const Color safe = Color(0xFF2E7D32);
  static const Color destroyed = Color(0xFF6A1B9A);

  // ================= LIGHT COLORS =================

  static const Color lightBg = Color(0xFFF4F7FB);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightDivider = Color(0xFFE2E8F0);

  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF475569);
  static const Color lightHint = Color(0xFF94A3B8);
  static const Color lightDisabled = Color(0xFFCBD5E1);

  // ================= DARK COLORS =================

  static const Color darkBg = Color(0xFF0B1120);
  static const Color darkSurface = Color(0xFF111827);
  static const Color darkCard = Color(0xFF1E293B);
  static const Color darkDivider = Color(0xFF334155);

  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFFCBD5E1);
  static const Color darkHint = Color(0xFF94A3B8);
  static const Color darkDisabled = Color(0xFF64748B);

  // ================= LIGHT THEME =================

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Inter",
    brightness: Brightness.light,

    primaryColor: primary,
    scaffoldBackgroundColor: lightBg,
    dividerColor: lightDivider,

    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: accent,
      surface: lightSurface,
      background: lightBg,

      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: lightTextPrimary,
      onBackground: lightTextPrimary,

      error: severe,
    ),

    /// APP BAR
    appBarTheme: AppBarTheme(
      backgroundColor: lightSurface,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,

      iconTheme: const IconThemeData(color: lightTextPrimary),

      titleTextStyle: const TextStyle(
        color: lightTextPrimary,
        fontSize: 19,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.3,
      ),
    ),

    /// CARD
    cardTheme: CardThemeData(
      color: lightCard,
      elevation: 0,
      shadowColor: Colors.black12,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),

    /// ICONS
    iconTheme: const IconThemeData(color: primary, size: 22),

    /// TEXT
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: lightTextPrimary,
      ),

      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: lightTextPrimary,
      ),

      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: lightTextPrimary,
      ),

      bodyMedium: TextStyle(fontSize: 13, color: lightTextSecondary),

      bodySmall: TextStyle(fontSize: 12, color: lightHint),
    ),

    /// BUTTONS
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,

        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,

        side: BorderSide(color: primary.withOpacity(0.5)),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    ),

    /// INPUT FIELDS
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightSurface,

      hintStyle: const TextStyle(color: lightHint, fontWeight: FontWeight.w500),

      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: lightDivider),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: lightDivider),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: primary, width: 2),
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
      secondary: accent,
      surface: darkSurface,
      background: darkBg,

      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: darkTextPrimary,
      onBackground: darkTextPrimary,

      error: severe,
    ),

    /// APP BAR
    appBarTheme: AppBarTheme(
      backgroundColor: darkBg,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,

      iconTheme: const IconThemeData(color: darkTextPrimary),

      titleTextStyle: const TextStyle(
        color: darkTextPrimary,
        fontSize: 19,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.3,
      ),
    ),

    /// CARD
    cardTheme: CardThemeData(
      color: darkCard,
      elevation: 0,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),

    /// ICONS
    iconTheme: const IconThemeData(color: Colors.white, size: 22),

    /// TEXT
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: darkTextPrimary,
      ),

      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: darkTextPrimary,
      ),

      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: darkTextPrimary,
      ),

      bodyMedium: TextStyle(fontSize: 13, color: darkTextSecondary),

      bodySmall: TextStyle(fontSize: 12, color: darkHint),
    ),

    /// BUTTONS
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,

        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,

        side: BorderSide(color: Colors.white.withOpacity(0.15)),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    ),

    /// INPUTS
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkCard,

      hintStyle: const TextStyle(color: darkHint),

      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: darkDivider),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: darkDivider),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: primary, width: 2),
      ),
    ),
  );
}
