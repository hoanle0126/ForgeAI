import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/training/widgets/training_error_state.dart';
import 'package:forge_ai/features/training/widgets/training_loading_state.dart';
import 'package:forge_ai/features/training/widgets/workout_library_card.dart';
import 'package:forge_ai/features/training/widgets/workout_library_empty_state.dart';
import 'package:forge_ai/features/training/widgets/workout_library_top_bar.dart';
import 'package:go_router/go_router.dart';

class WorkoutLibraryScreen extends ConsumerWidget {
  const WorkoutLibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutsAsync = ref.watch(workoutLibraryProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WorkoutLibraryTopBar(
              onBack: () => context.pop(),
              onCreate: () => context.push(AppRoutes.workoutCreate),
            ),
            Expanded(
              child: workoutsAsync.when(
                data: (workouts) => _WorkoutLibraryList(workouts: workouts),
                loading: () => const SingleChildScrollView(
                  padding: AppSpacing.screenPadding,
                  child: TrainingLoadingState(),
                ),
                error: (error, stackTrace) => SingleChildScrollView(
                  padding: AppSpacing.screenPadding,
                  child: TrainingErrorState(
                    onRetry: () => ref.invalidate(workoutLibraryProvider),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WorkoutLibraryList extends StatelessWidget {
  const _WorkoutLibraryList({required this.workouts});

  final List<WorkoutLibraryWorkout> workouts;

  @override
  Widget build(BuildContext context) {
    if (workouts.isEmpty) {
      return SingleChildScrollView(
        padding: AppSpacing.screenPadding.add(
          const EdgeInsets.only(top: AppSpacing.lg),
        ),
        child: WorkoutLibraryEmptyState(
          onCreateWorkout: () => context.push(AppRoutes.workoutCreate),
        ),
      );
    }

    return ListView.separated(
      padding: AppSpacing.screenPadding.add(
        const EdgeInsets.only(top: AppSpacing.sm, bottom: AppSpacing.xxl),
      ),
      itemCount: workouts.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.md),
      itemBuilder: (context, index) {
        final workout = workouts[index];
        return WorkoutLibraryCard(
          workout: workout,
          onTap: () => context.push(AppRoutes.workoutDetail(workout.id)),
        );
      },
    );
  }
}
