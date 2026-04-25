import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class TodayPlanSignals extends StatelessWidget {
  const TodayPlanSignals({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _PlanSignal(
            label: 'Readiness',
            value: '72',
            accentColor: AppColors.success,
          ),
        ),
        SizedBox(width: AppSpacing.md),
        Expanded(
          child: _PlanSignal(
            label: 'Sleep',
            value: '6h',
            accentColor: AppColors.energy,
          ),
        ),
      ],
    );
  }
}

class _PlanSignal extends StatelessWidget {
  const _PlanSignal({
    required this.label,
    required this.value,
    required this.accentColor,
  });

  final String label;
  final String value;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTypography.labelUppercase.copyWith(
              color: AppColors.textDark,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: AppTypography.statMedium.copyWith(color: accentColor),
          ),
        ],
      ),
    );
  }
}
