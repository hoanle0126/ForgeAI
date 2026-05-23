import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/training_statistics_models.dart';
import 'package:forge_ai/features/training/widgets/metric_pill.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TrainingStatisticsHeroCard extends StatelessWidget {
  const TrainingStatisticsHeroCard({super.key, required this.statistics});

  final TrainingStatisticsData statistics;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        image: const DecorationImage(
          image: AssetImage('assets/images/dark_gym.png'),
          fit: BoxFit.cover,
          opacity: 0.24,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'TRAINING STATISTICS',
                  style: AppTypography.labelUppercase.copyWith(
                    color: AppColors.energy,
                  ),
                ),
                const Spacer(),
                Icon(
                  PhosphorIcons.chartBar(PhosphorIconsStyle.fill),
                  color: AppColors.cardWhite,
                  size: 22,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              statistics.heroTitle,
              style: AppTypography.h2.copyWith(color: AppColors.cardWhite),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              statistics.heroSummary,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.cardWhite.withValues(alpha: 0.76),
                height: 1.45,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                MetricPill(label: '${statistics.focusGoalLabel} focus'),
                MetricPill(
                  label: '${statistics.averageSessionMinutes} min avg',
                ),
                MetricPill(label: '${statistics.completionRateLabel} complete'),
                MetricPill(label: statistics.busiestDayLabel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
