import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/training/models/training_statistics_models.dart';
import 'package:forge_ai/features/training/providers/training_statistics_provider.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/training/widgets/training_empty_state.dart';
import 'package:forge_ai/features/training/widgets/training_error_state.dart';
import 'package:forge_ai/features/training/widgets/training_statistics_content.dart';
import 'package:forge_ai/features/training/widgets/training_statistics_loading_state.dart';
import 'package:forge_ai/features/training/widgets/training_statistics_top_bar.dart';
import 'package:go_router/go_router.dart';

class TrainingStatisticsScreen extends ConsumerWidget {
  const TrainingStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statisticsAsync = ref.watch(trainingStatisticsProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding.add(
            const EdgeInsets.only(top: AppSpacing.base, bottom: AppSpacing.xxl),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TrainingStatisticsTopBar(onBack: () => context.pop()),
              const SizedBox(height: AppSpacing.lg),
              statisticsAsync.when(
                data: (statistics) => _StatisticsState(
                  statistics: statistics,
                  onCreateWorkout: () => context.push(AppRoutes.workoutCreate),
                  onAiBuildWorkout: () =>
                      context.push(AppRoutes.workoutBuilderGoal),
                ),
                loading: () => const TrainingStatisticsLoadingState(),
                error: (error, stackTrace) => TrainingErrorState(
                  title: 'We could not load your statistics',
                  description:
                      'Check your connection and sync again. ForgeAI will rebuild the latest training signals from your saved workouts.',
                  onRetry: () => ref.invalidate(workoutLibraryProvider),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatisticsState extends StatelessWidget {
  const _StatisticsState({
    required this.statistics,
    required this.onCreateWorkout,
    required this.onAiBuildWorkout,
  });

  final TrainingStatisticsData statistics;
  final VoidCallback onCreateWorkout;
  final VoidCallback onAiBuildWorkout;

  @override
  Widget build(BuildContext context) {
    if (!statistics.hasTrackedWorkouts) {
      return TrainingEmptyState(
        title: 'No statistics yet',
        description:
            'Save or complete a workout so ForgeAI can map weekly load, focus mix, and exercise density.',
        onPlanWorkout: onCreateWorkout,
        onAiBuildWorkout: onAiBuildWorkout,
      );
    }

    return TrainingStatisticsContent(statistics: statistics);
  }
}
