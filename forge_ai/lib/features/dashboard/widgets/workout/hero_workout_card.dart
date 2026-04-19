import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/dashboard/widgets/workout/hero_workout_card_actions.dart';
import 'package:forge_ai/features/dashboard/widgets/workout/hero_workout_exercise_count.dart';
import 'package:forge_ai/features/dashboard/widgets/workout/hero_workout_meta_row.dart';

class HeroWorkoutCard extends StatelessWidget {
  const HeroWorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        image: const DecorationImage(
          image: AssetImage('assets/images/hero_workout.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          gradient: LinearGradient(
            colors: [
              AppColors.textDark.withValues(alpha: 0.8),
              AppColors.textDark.withValues(alpha: 0.1),
              AppColors.transparent,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeroWorkoutMetaRow(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upper\nBody',
                  style: AppTypography.h1.copyWith(
                    color: AppColors.cardWhite,
                    fontSize: 40,
                    height: 1.0,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                const HeroWorkoutExerciseCount(),
                const SizedBox(height: AppSpacing.lg),
                const HeroWorkoutCardActions(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
