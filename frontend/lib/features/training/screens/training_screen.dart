import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/providers/training_workout_provider.dart';
import 'package:forge_ai/features/training/widgets/today_workout_card.dart';
import 'package:forge_ai/features/training/widgets/training_empty_state.dart';
import 'package:forge_ai/features/training/widgets/training_error_state.dart';
import 'package:forge_ai/features/training/widgets/training_header.dart';
import 'package:forge_ai/features/training/widgets/training_insight_card.dart';
import 'package:forge_ai/features/training/widgets/training_loading_state.dart';
import 'package:forge_ai/features/training/widgets/training_more_sheet.dart';
import 'package:forge_ai/features/training/widgets/upcoming_workout_list.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_row.dart';
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
                    onPlanWorkout: () => TrainingMoreSheet.show(context),
                    onAiBuildWorkout: () =>
                        context.push(AppRoutes.workoutBuilderGoal),
                  )
                : _TrainingContent(
                    plan: plan,
                    onStartWorkout: () =>
                        context.push(AppRoutes.workoutPreview),
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

class _TrainingContent extends StatelessWidget {
  const _TrainingContent({required this.plan, required this.onStartWorkout});

  final TrainingWorkoutPlan plan;
  final VoidCallback onStartWorkout;

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
