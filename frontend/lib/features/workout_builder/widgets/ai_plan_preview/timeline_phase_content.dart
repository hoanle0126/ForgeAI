import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class TimelinePhaseContent extends StatelessWidget {
  const TimelinePhaseContent({
    super.key,
    required this.phase,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
  });

  final String phase;
  final String title;
  final String subtitle;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              phase,
              style: AppTypography.labelUppercase.copyWith(
                color: color,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.inputBg,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Text(
                subtitle,
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.textDisabled,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(title, style: AppTypography.h3),
        const SizedBox(height: AppSpacing.xs),
        Text(
          description,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textDisabled,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
