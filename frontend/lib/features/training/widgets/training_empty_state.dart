import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/widgets/training_setup_step.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TrainingEmptyState extends StatelessWidget {
  const TrainingEmptyState({super.key, required this.onPlanWorkout});

  final VoidCallback onPlanWorkout;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _EmptyStateSignal(),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'No training plan yet',
            style: AppTypography.h1.copyWith(color: AppColors.cardWhite),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Create your first workout so ForgeAI can organize today, the next session, and weekly recovery cues.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.74),
              height: 1.4,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const TrainingSetupStep(
            label: '01',
            title: 'Pick a focus',
            description: 'Strength, fat loss, mobility, or a beginner mix.',
          ),
          const SizedBox(height: AppSpacing.md),
          const TrainingSetupStep(
            label: '02',
            title: 'Add equipment',
            description: 'Match the plan to what you can actually use.',
          ),
          const SizedBox(height: AppSpacing.md),
          const TrainingSetupStep(
            label: '03',
            title: 'Lock a session',
            description: 'Get a practical workout instead of a blank week.',
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            text: 'Build First Workout',
            icon: PhosphorIcons.plus(PhosphorIconsStyle.bold),
            onPressed: onPlanWorkout,
          ),
        ],
      ),
    );
  }
}

class _EmptyStateSignal extends StatelessWidget {
  const _EmptyStateSignal();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.xxxl,
      height: AppSpacing.xxxl,
      decoration: BoxDecoration(
        color: AppColors.cardWhite.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.cardWhite.withValues(alpha: 0.16)),
      ),
      child: Icon(
        PhosphorIcons.barbell(PhosphorIconsStyle.fill),
        color: AppColors.energy,
        size: 24,
      ),
    );
  }
}
