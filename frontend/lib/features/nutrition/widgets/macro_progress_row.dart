import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class MacroProgressRow extends StatelessWidget {
  const MacroProgressRow({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    required this.progress,
  });

  final String label;
  final String value;
  final Color color;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 35,
          child: Text(
            label,
            style: AppTypography.labelUppercase.copyWith(
              color: color,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Container(
            height: 6,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppColors.cardWhite.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(3),
            ),
            child: FractionallySizedBox(
              widthFactor: progress.clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        SizedBox(
          width: 45,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: AppTypography.statSmall.copyWith(
              color: AppColors.cardWhite,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
