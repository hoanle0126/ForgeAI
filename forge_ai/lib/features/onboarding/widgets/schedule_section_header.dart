import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class ScheduleSectionHeader extends StatelessWidget {
  const ScheduleSectionHeader(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTypography.labelUppercase.copyWith(
        color: AppColors.textDark.withValues(alpha: 0.8),
        fontWeight: FontWeight.w800,
        letterSpacing: 1.2,
      ),
    );
  }
}
