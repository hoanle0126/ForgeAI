import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/widgets/metric_pill.dart';
import 'package:forge_ai/features/training/widgets/workout_stat.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TodayWorkoutCard extends StatelessWidget {
  const TodayWorkoutCard({super.key, this.onStartWorkout});

  final VoidCallback? onStartWorkout;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        image: const DecorationImage(
          image: AssetImage('assets/images/dark_gym.png'),
          fit: BoxFit.cover,
          opacity: 0.28,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s Workout',
                  style: AppTypography.labelUppercase.copyWith(
                    color: AppColors.cardWhite.withValues(alpha: 0.78),
                  ),
                ),
                const MetricPill(label: '42 min'),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Upper Strength',
              style: AppTypography.h1.copyWith(color: AppColors.cardWhite),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Push, pull, and core stability with recovery-aware volume.',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.cardWhite.withValues(alpha: 0.74),
                height: 1.4,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                WorkoutStat(
                  icon: PhosphorIcons.barbell(PhosphorIconsStyle.fill),
                  label: '6 exercises',
                ),
                const SizedBox(width: AppSpacing.base),
                WorkoutStat(
                  icon: PhosphorIcons.lightning(PhosphorIconsStyle.fill),
                  label: 'Moderate',
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              text: 'Start Workout',
              icon: PhosphorIcons.play(PhosphorIconsStyle.fill),
              onPressed: onStartWorkout,
            ),
          ],
        ),
      ),
    );
  }
}
