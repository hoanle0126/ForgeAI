import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/training/widgets/today_workout_card.dart';
import 'package:forge_ai/features/training/widgets/training_header.dart';
import 'package:forge_ai/features/training/widgets/training_insight_card.dart';
import 'package:forge_ai/features/training/widgets/upcoming_workout_list.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_row.dart';
import 'package:go_router/go_router.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.md),
              const TrainingHeader(),
              const SizedBox(height: AppSpacing.lg),
              TodayWorkoutCard(
                onStartWorkout: () => context.push(AppRoutes.workoutPreview),
              ),
              const SizedBox(height: AppSpacing.lg),
              const WeeklyPlanRow(),
              const SizedBox(height: AppSpacing.lg),
              const UpcomingWorkoutList(),
              const SizedBox(height: AppSpacing.sm),
              const TrainingInsightCard(),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
