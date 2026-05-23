import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';
import 'package:forge_ai/features/workout_builder/widgets/common/workout_builder_app_bar.dart';
import 'package:forge_ai/features/workout_builder/widgets/goal_selection/analysis_card.dart';
import 'package:forge_ai/features/workout_builder/widgets/goal_selection/goal_selection_action_bar.dart';
import 'package:forge_ai/features/workout_builder/widgets/goal_selection/goal_selection_header.dart';
import 'package:forge_ai/features/workout_builder/widgets/goal_selection/workout_goal_list.dart';

class GoalSelectionScreen extends ConsumerWidget {
  const GoalSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGoal = ref.watch(selectedWorkoutGoalProvider);
    ref.watch(workoutBuilderProfilePrefillProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const WorkoutBuilderAppBar(step: 1, totalSteps: 5, title: 'Target'),
            Expanded(
              child: SingleChildScrollView(
                padding: AppSpacing.screenPadding.copyWith(
                  bottom: AppSpacing.xxl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: AppSpacing.base),
                    const GoalSelectionHeader(),
                    const SizedBox(height: AppSpacing.xl),
                    const WorkoutGoalList(),
                    const SizedBox(height: AppSpacing.xl),
                    const PersonalizedAnalysisCard()
                        .animate()
                        .fadeIn(delay: 600.ms)
                        .moveY(begin: 20, end: 0),
                  ],
                ),
              ),
            ),
            GoalSelectionActionBar(selectedGoal: selectedGoal),
          ],
        ),
      ),
    );
  }
}
