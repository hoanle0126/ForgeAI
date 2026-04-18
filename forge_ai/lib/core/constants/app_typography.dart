import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTypography {
  // Headings — DM Sans
  static TextStyle h1 = GoogleFonts.dmSans(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: AppColors.textDark,
  );

  static TextStyle h2 = GoogleFonts.dmSans(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColors.textDark,
  );

  static TextStyle h3 = GoogleFonts.dmSans(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static TextStyle h4 = GoogleFonts.dmSans(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  // Body — Manrope
  static TextStyle bodyLarge = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static TextStyle bodyMedium = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static TextStyle bodySmall = GoogleFonts.manrope(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static TextStyle bodySemiBold = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textMuted,
  );

  // Labels
  static TextStyle label = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textDisabled,
  );

  static TextStyle labelUppercase = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textDisabled,
    letterSpacing: 1,
  );

  // Numbers & Stats — JetBrains Mono
  static TextStyle statLarge = GoogleFonts.jetBrainsMono(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static TextStyle statMedium = GoogleFonts.jetBrainsMono(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static TextStyle statSmall = GoogleFonts.jetBrainsMono(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );
}
