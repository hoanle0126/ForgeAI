import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/widgets/workout_ai_note_card.dart';
import 'package:forge_ai/features/training/widgets/workout_exercise_checklist.dart';
import 'package:forge_ai/features/training/widgets/workout_preview_top_bar.dart';
import 'package:forge_ai/features/training/widgets/workout_summary_card.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';

class WorkoutPreviewScreen extends StatelessWidget {
  const WorkoutPreviewScreen({
    super.key,
    this.plan = todayTrainingWorkoutPlan,
    this.onBeginWorkout,
  });

  final TrainingWorkoutPlan plan;
  final VoidCallback? onBeginWorkout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.base,
            AppSpacing.base,
            AppSpacing.base,
            AppSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WorkoutPreviewTopBar(onBack: () => Navigator.maybePop(context)),
              const SizedBox(height: AppSpacing.lg),
              WorkoutSummaryCard(plan: plan),
              const SizedBox(height: AppSpacing.base),
              WorkoutAiNoteCard(note: plan.aiNote),
              const SizedBox(height: AppSpacing.base),
              WorkoutExerciseChecklist(exercises: plan.exercises),
              const SizedBox(height: AppSpacing.lg),
              AppButton(text: 'Begin Workout', onPressed: onBeginWorkout),
            ],
          ),
        ),
      ),
    );
  }
}
