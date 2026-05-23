import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/training_statistics_models.dart';
import 'package:forge_ai/features/training/widgets/training_statistics_weekly_load_chart.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class TrainingStatisticsWeeklyLoadCard extends StatelessWidget {
  const TrainingStatisticsWeeklyLoadCard({super.key, required this.statistics});

  final TrainingStatisticsData statistics;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Weekly load', style: AppTypography.h4),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Minutes mapped into this week from scheduled or recent workout activity.',
            style: AppTypography.bodySmall,
          ),
          const SizedBox(height: AppSpacing.base),
          SizedBox(
            height: AppSpacing.xxxl * 4,
            child: TrainingStatisticsWeeklyLoadChart(
              points: statistics.weeklyLoad,
            ),
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            statistics.hasWeeklyLoad
                ? '${statistics.busiestDayLabel} is carrying the heaviest block right now.'
                : 'Lock workout dates to reveal where the week actually gets heavy.',
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
