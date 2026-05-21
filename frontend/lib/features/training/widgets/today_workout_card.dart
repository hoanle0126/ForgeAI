import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/widgets/metric_pill.dart';
import 'package:forge_ai/features/training/widgets/workout_stat.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TodayWorkoutCard extends StatelessWidget {
  const TodayWorkoutCard({
    super.key,
    required this.plan,
    this.eyebrow = 'Today\'s Workout',
    this.onStartWorkout,
  }) : onEmptyAction = null;

  const TodayWorkoutCard.emptyToday({super.key, this.onEmptyAction})
    : plan = null,
      eyebrow = 'Today',
      onStartWorkout = null;

  final TrainingWorkoutPlan? plan;
  final String eyebrow;
  final VoidCallback? onStartWorkout;
  final VoidCallback? onEmptyAction;

  @override
  Widget build(BuildContext context) {
    final workoutPlan = plan;
    final isEmpty = workoutPlan == null;

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
                  eyebrow,
                  style: AppTypography.labelUppercase.copyWith(
                    color: AppColors.cardWhite.withValues(alpha: 0.78),
                  ),
                ),
                MetricPill(label: isEmpty ? 'Open' : workoutPlan.durationLabel),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              isEmpty ? 'No workout today' : workoutPlan.title,
              style: AppTypography.h1.copyWith(color: AppColors.cardWhite),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              isEmpty
                  ? 'Today has no workout scheduled. Keep it light or create one for today.'
                  : workoutPlan.aiNote,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.cardWhite.withValues(alpha: 0.74),
                height: 1.4,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                WorkoutStat(
                  icon: isEmpty
                      ? PhosphorIcons.calendarDots(PhosphorIconsStyle.fill)
                      : PhosphorIcons.barbell(PhosphorIconsStyle.fill),
                  label: isEmpty
                      ? 'No workout'
                      : workoutPlan.exerciseCountLabel,
                ),
                const SizedBox(width: AppSpacing.base),
                WorkoutStat(
                  icon: PhosphorIcons.lightning(PhosphorIconsStyle.fill),
                  label: isEmpty ? 'Open day' : workoutPlan.intensityLabel,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              text: isEmpty ? 'Create Workout' : 'Start Workout',
              icon: isEmpty
                  ? PhosphorIcons.plus()
                  : PhosphorIcons.play(PhosphorIconsStyle.fill),
              onPressed: isEmpty ? onEmptyAction : onStartWorkout,
            ),
          ],
        ),
      ),
    );
  }
}
