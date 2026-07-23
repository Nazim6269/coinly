import 'package:coinly/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryAccent,
        secondary: AppColors.positive,
        error: AppColors.negative,
        surface: AppColors.surface,
        onSurface: AppColors.textOnLight,
        onPrimary: AppColors.inkNavy,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.spaceGrotesk(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.textOnDark,
        ),
        headlineMedium: GoogleFonts.spaceGrotesk(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.textOnDark,
        ),
        bodyLarge: GoogleFonts.inter(fontSize: 16, color: AppColors.textOnDark),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          color: AppColors.textOnDark.withValues(alpha: 0.8),
        ),
        titleLarge: GoogleFonts.jetBrainsMono(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.textOnDark,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        titleTextStyle: GoogleFonts.spaceGrotesk(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textOnDark,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryAccent,
        foregroundColor: AppColors.inkNavy,
      ),
    );
  }
}
