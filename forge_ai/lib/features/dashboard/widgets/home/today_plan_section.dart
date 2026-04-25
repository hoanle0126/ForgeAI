import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/dashboard/widgets/home/today_plan_intro_card.dart';
import 'package:forge_ai/features/dashboard/widgets/workout/hero_workout_card.dart';

class TodayPlanSection extends StatelessWidget {
  const TodayPlanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TodayPlanIntroCard(),
        SizedBox(height: AppSpacing.sm),
        HeroWorkoutCard(),
      ],
    );
  }
}
