import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/widgets/today_workout_card.dart';
import 'package:forge_ai/features/training/widgets/training_header.dart';
import 'package:forge_ai/features/training/widgets/training_insight_card.dart';
import 'package:forge_ai/features/training/widgets/upcoming_workout_list.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_row.dart';
import 'package:forge_ai/features/training/widgets/workout_library_entry_card.dart';

class TrainingContent extends StatelessWidget {
  const TrainingContent({
    super.key,
    required this.plan,
    required this.onStartWorkout,
    required this.onOpenLibrary,
    required this.onCreateWorkout,
  });

  final TrainingWorkoutPlan plan;
  final VoidCallback onStartWorkout;
  final VoidCallback onOpenLibrary;
  final VoidCallback onCreateWorkout;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: AppSpacing.md),
        const TrainingHeader(),
        const SizedBox(height: AppSpacing.lg),
        TodayWorkoutCard(plan: plan, onStartWorkout: onStartWorkout),
        const SizedBox(height: AppSpacing.lg),
        WorkoutLibraryEntryCard(
          onOpenLibrary: onOpenLibrary,
          onCreateWorkout: onCreateWorkout,
        ),
        const SizedBox(height: AppSpacing.lg),
        WeeklyPlanRow(statusLabel: plan.statusLabel),
        const SizedBox(height: AppSpacing.lg),
        UpcomingWorkoutList(currentPlan: plan),
        const SizedBox(height: AppSpacing.sm),
        TrainingInsightCard(note: plan.aiNote),
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}
