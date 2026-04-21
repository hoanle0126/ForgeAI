import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';

class MuscleStatusBadge extends StatelessWidget {
  const MuscleStatusBadge({super.key, required this.status});

  final MuscleTrainingStatus status;

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      MuscleTrainingStatus.recovered => AppColors.success,
      MuscleTrainingStatus.moderate => AppColors.energy,
      MuscleTrainingStatus.overloaded => AppColors.sportOrange,
      MuscleTrainingStatus.neutral => AppColors.textDisabled,
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Text(
        _label,
        style: AppTypography.labelUppercase.copyWith(color: color),
      ),
    );
  }

  String get _label {
    return switch (status) {
      MuscleTrainingStatus.recovered => 'READY',
      MuscleTrainingStatus.moderate => 'MODERATE',
      MuscleTrainingStatus.overloaded => 'OVERLOAD',
      MuscleTrainingStatus.neutral => 'NEUTRAL',
    };
  }
}
