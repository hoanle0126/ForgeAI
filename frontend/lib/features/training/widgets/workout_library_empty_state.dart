import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutLibraryEmptyState extends StatelessWidget {
  const WorkoutLibraryEmptyState({super.key, required this.onCreateWorkout});

  final VoidCallback onCreateWorkout;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppSpacing.xxxl,
            height: AppSpacing.xxxl,
            decoration: BoxDecoration(
              color: AppColors.cardWhite.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            ),
            child: Icon(
              PhosphorIcons.barbell(PhosphorIconsStyle.fill),
              color: AppColors.energy,
              size: 24,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'No saved workouts yet',
            style: AppTypography.h2.copyWith(color: AppColors.cardWhite),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Create one workout first. It will appear here so you can review, repeat, or start it later.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.74),
              height: 1.4,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            text: 'Create Workout',
            icon: PhosphorIcons.plus(PhosphorIconsStyle.bold),
            onPressed: onCreateWorkout,
          ),
        ],
      ),
    );
  }
}
