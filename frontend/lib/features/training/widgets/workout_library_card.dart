import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutLibraryCard extends StatelessWidget {
  const WorkoutLibraryCard({
    super.key,
    required this.workout,
    required this.onTap,
  });

  final WorkoutLibraryWorkout workout;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _WorkoutIconTile(),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(workout.title, style: AppTypography.h4),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '${workout.goalLabel} · ${workout.scheduleLabel}',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Icon(
                PhosphorIcons.caretRight(PhosphorIconsStyle.bold),
                color: AppColors.textDisabled,
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _WorkoutMetaPill(label: workout.statusLabel),
              _WorkoutMetaPill(label: workout.durationLabel),
              _WorkoutMetaPill(label: workout.exerciseCountLabel),
            ],
          ),
        ],
      ),
    );
  }
}

class _WorkoutIconTile extends StatelessWidget {
  const _WorkoutIconTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.xxxl,
      height: AppSpacing.xxxl,
      decoration: BoxDecoration(
        color: AppColors.sportOrangeLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Icon(
        PhosphorIcons.barbell(PhosphorIconsStyle.bold),
        color: AppColors.sportOrange,
        size: 22,
      ),
    );
  }
}

class _WorkoutMetaPill extends StatelessWidget {
  const _WorkoutMetaPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Text(
        label,
        style: AppTypography.label.copyWith(color: AppColors.textMuted),
      ),
    );
  }
}
