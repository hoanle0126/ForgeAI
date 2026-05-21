import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/training/widgets/training_content.dart';
import 'package:forge_ai/features/training/widgets/training_empty_state.dart';
import 'package:forge_ai/features/training/widgets/training_error_state.dart';
import 'package:forge_ai/features/training/widgets/training_header.dart';
import 'package:forge_ai/features/training/widgets/training_loading_state.dart';
import 'package:go_router/go_router.dart';

class TrainingScreen extends ConsumerWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutAsync = ref.watch(workoutLibraryProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: workoutAsync.when(
            data: (workouts) {
              final plans = workouts
                  .where(_isUsableTrainingWorkout)
                  .map((workout) => workout.toTrainingPlan())
                  .toList(growable: false);

              if (plans.isEmpty) {
                return _TrainingEmptyContent(
                  onPlanWorkout: () => context.push(AppRoutes.workoutCreate),
                  onAiBuildWorkout: () =>
                      context.push(AppRoutes.workoutBuilderGoal),
                );
              }

              return TrainingContent(
                plans: plans,
                onStartWorkout: (plan) =>
                    context.push(AppRoutes.workoutPreview, extra: plan),
                onOpenLibrary: () => context.push(AppRoutes.workoutLibrary),
                onCreateWorkout: () => context.push(AppRoutes.workoutCreate),
              );
            },
            loading: () => const TrainingLoadingState(),
            error: (error, stackTrace) => TrainingErrorState(
              onRetry: () => ref.invalidate(workoutLibraryProvider),
            ),
          ),
        ),
      ),
    );
  }

  bool _isUsableTrainingWorkout(WorkoutLibraryWorkout workout) {
    return workout.status != TrainingWorkoutStatus.archived &&
        workout.items.isNotEmpty;
  }
}

class _TrainingEmptyContent extends StatelessWidget {
  const _TrainingEmptyContent({
    required this.onPlanWorkout,
    required this.onAiBuildWorkout,
  });

  final VoidCallback onPlanWorkout;
  final VoidCallback onAiBuildWorkout;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: AppSpacing.md),
        const TrainingHeader(),
        const SizedBox(height: AppSpacing.lg),
        TrainingEmptyState(
          onPlanWorkout: onPlanWorkout,
          onAiBuildWorkout: onAiBuildWorkout,
        ),
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}
