import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/training/providers/training_workout_provider.dart';
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
    final workoutAsync = ref.watch(trainingWorkoutProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: workoutAsync.when(
            data: (plan) => plan == null || plan.exercises.isEmpty
                ? _TrainingEmptyContent(
                    onPlanWorkout: () => context.push(AppRoutes.workoutCreate),
                    onAiBuildWorkout: () =>
                        context.push(AppRoutes.workoutBuilderGoal),
                  )
                : TrainingContent(
                    plan: plan,
                    onStartWorkout: () =>
                        context.push(AppRoutes.workoutPreview, extra: plan),
                    onOpenLibrary: () => context.push(AppRoutes.workoutLibrary),
                    onCreateWorkout: () =>
                        context.push(AppRoutes.workoutCreate),
                  ),
            loading: () => const TrainingLoadingState(),
            error: (error, stackTrace) => TrainingErrorState(
              onRetry: () => ref.invalidate(trainingWorkoutProvider),
            ),
          ),
        ),
      ),
    );
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
