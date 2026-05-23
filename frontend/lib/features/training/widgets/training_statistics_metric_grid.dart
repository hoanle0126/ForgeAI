import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/training_statistics_models.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TrainingStatisticsMetricGrid extends StatelessWidget {
  const TrainingStatisticsMetricGrid({super.key, required this.statistics});

  final TrainingStatisticsData statistics;

  @override
  Widget build(BuildContext context) {
    final metrics = [
      _TrainingMetric(
        label: 'ACTIVE PLANS',
        value: '${statistics.trackedWorkouts}',
        detail: 'saved workouts',
        icon: PhosphorIcons.barbell(PhosphorIconsStyle.fill),
        color: AppColors.sportOrange,
      ),
      _TrainingMetric(
        label: 'COMPLETED',
        value: '${statistics.completedWorkouts}',
        detail: 'cleared sessions',
        icon: PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
        color: AppColors.success,
      ),
      _TrainingMetric(
        label: 'MINUTES',
        value: '${statistics.plannedMinutes}',
        detail: 'planned load',
        icon: PhosphorIcons.timer(PhosphorIconsStyle.fill),
        color: AppColors.aiBlue,
      ),
      _TrainingMetric(
        label: 'SET BLOCKS',
        value: '${statistics.totalSetBlocks}',
        detail: 'work segments',
        icon: PhosphorIcons.target(PhosphorIconsStyle.fill),
        color: AppColors.energy,
      ),
    ];

    return GridView.builder(
      itemCount: metrics.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSpacing.base,
        mainAxisSpacing: AppSpacing.base,
        childAspectRatio: 1.24,
      ),
      itemBuilder: (context, index) => _MetricTile(metric: metrics[index]),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.metric});

  final _TrainingMetric metric;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppSpacing.xxxl,
            height: AppSpacing.xxxl,
            decoration: BoxDecoration(
              color: metric.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            ),
            child: Icon(metric.icon, color: metric.color, size: 26),
          ),
          const Spacer(),
          Text(
            metric.value,
            style: AppTypography.statLarge.copyWith(fontSize: 26),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(metric.label, style: AppTypography.labelUppercase),
          const SizedBox(height: AppSpacing.xs),
          Text(metric.detail, style: AppTypography.bodySmall),
        ],
      ),
    );
  }
}

class _TrainingMetric {
  const _TrainingMetric({
    required this.label,
    required this.value,
    required this.detail,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final String detail;
  final IconData icon;
  final Color color;
}
