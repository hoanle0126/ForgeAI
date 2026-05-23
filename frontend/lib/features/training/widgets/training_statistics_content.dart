import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/training/models/training_statistics_models.dart';
import 'package:forge_ai/features/training/widgets/training_insight_card.dart';
import 'package:forge_ai/features/training/widgets/training_statistics_distribution_card.dart';
import 'package:forge_ai/features/training/widgets/training_statistics_hero_card.dart';
import 'package:forge_ai/features/training/widgets/training_statistics_metric_grid.dart';
import 'package:forge_ai/features/training/widgets/training_statistics_top_exercises_card.dart';
import 'package:forge_ai/features/training/widgets/training_statistics_weekly_load_card.dart';

class TrainingStatisticsContent extends StatelessWidget {
  const TrainingStatisticsContent({super.key, required this.statistics});

  final TrainingStatisticsData statistics;

  @override
  Widget build(BuildContext context) {
    final sections = [
      TrainingStatisticsHeroCard(statistics: statistics),
      TrainingStatisticsMetricGrid(statistics: statistics),
      TrainingStatisticsWeeklyLoadCard(statistics: statistics),
      TrainingStatisticsDistributionCard(
        title: 'Status mix',
        caption: 'Where active workouts currently sit.',
        segments: statistics.statusSegments,
      ),
      TrainingStatisticsDistributionCard(
        title: 'Goal focus',
        caption: 'What your saved block is aiming to improve.',
        segments: statistics.goalSegments,
      ),
      TrainingStatisticsTopExercisesCard(exercises: statistics.topExercises),
      TrainingInsightCard(note: statistics.insightText),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final section in sections.indexed) ...[
          section.$2
              .animate(delay: (section.$1 * 80).ms)
              .fadeIn(duration: 320.ms, curve: Curves.easeOut)
              .slideY(begin: 0.08, end: 0),
          if (section.$1 != sections.length - 1)
            const SizedBox(height: AppSpacing.lg),
        ],
      ],
    );
  }
}
