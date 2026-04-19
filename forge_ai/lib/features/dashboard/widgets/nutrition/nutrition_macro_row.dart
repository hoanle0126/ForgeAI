import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:percent_indicator/percent_indicator.dart';

class NutritionMacroRow extends StatelessWidget {
  const NutritionMacroRow({
    super.key,
    required this.label,
    required this.value,
    required this.percent,
    required this.color,
  });

  final String label;
  final String value;
  final double percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            label,
            style: AppTypography.bodySmall.copyWith(fontSize: 12),
          ),
        ),
        Expanded(
          child: LinearPercentIndicator(
            lineHeight: AppSpacing.sm,
            percent: percent,
            progressColor: color,
            backgroundColor: AppColors.inputBg,
            barRadius: const Radius.circular(AppSpacing.xs),
            padding: EdgeInsets.zero,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        SizedBox(
          width: 36,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: AppTypography.statSmall.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
