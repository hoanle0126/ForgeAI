import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/training/providers/active_workout_session_provider.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/training/screens/workout_detail_delete_handler.dart';
import 'package:forge_ai/features/training/widgets/training_error_state.dart';
import 'package:forge_ai/features/training/widgets/training_loading_state.dart';
import 'package:forge_ai/features/training/widgets/workout_detail_summary_card.dart';
import 'package:forge_ai/features/training/widgets/workout_detail_top_bar.dart';
import 'package:forge_ai/features/training/widgets/workout_exercise_checklist.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutDetailScreen extends ConsumerWidget {
  const WorkoutDetailScreen({super.key, required this.workoutId});

  final String workoutId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutAsync = ref.watch(workoutDetailProvider(workoutId));

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: workoutAsync.when(
          data: (workout) => _WorkoutDetailContent(workout: workout),
          loading: () => const SingleChildScrollView(
            padding: AppSpacing.screenPadding,
            child: TrainingLoadingState(),
          ),
          error: (error, stackTrace) => SingleChildScrollView(
            padding: AppSpacing.screenPadding,
            child: TrainingErrorState(
              onRetry: () => ref.invalidate(workoutDetailProvider(workoutId)),
            ),
          ),
        ),
      ),
    );
  }
}

class _WorkoutDetailContent extends ConsumerWidget {
  const _WorkoutDetailContent({required this.workout});

  final WorkoutLibraryWorkout workout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plan = workout.toTrainingPlan();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.base,
        AppSpacing.base,
        AppSpacing.base,
        AppSpacing.xxl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WorkoutDetailTopBar(
            onBack: () => context.pop(),
            onEdit: () => context.push(AppRoutes.workoutCreate, extra: workout),
            onDelete: () => handleWorkoutDelete(
              context: context,
              ref: ref,
              workout: workout,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          WorkoutDetailSummaryCard(workout: workout),
          const SizedBox(height: AppSpacing.base),
          WorkoutExerciseChecklist(exercises: plan.exercises),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            text: 'Start Workout',
            icon: PhosphorIcons.play(PhosphorIconsStyle.fill),
            onPressed: workout.items.isEmpty
                ? null
                : () {
                    ref
                        .read(activeWorkoutSessionProvider.notifier)
                        .loadPlan(plan);
                    context.push(AppRoutes.workoutPreview, extra: plan);
                  },
          ),
        ],
      ),
    );
  }
}
