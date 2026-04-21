import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';

class MuscleRecoveryBalanceChart extends StatelessWidget {
  const MuscleRecoveryBalanceChart({super.key, required this.points});

  final List<ChartPoint> points;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final point in points) ...[
          Row(
            children: [
              SizedBox(
                width: AppSpacing.xxxl * 2,
                child: Text(point.label, style: AppTypography.label),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  child: LinearProgressIndicator(
                    value: (point.value / 100).clamp(0, 1).toDouble(),
                    minHeight: AppSpacing.sm,
                    backgroundColor: AppColors.inputBg,
                    color: point.label == 'Load'
                        ? AppColors.sportOrange
                        : AppColors.success,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                point.value.toStringAsFixed(0),
                style: AppTypography.statSmall,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
      ],
    );
  }
}
