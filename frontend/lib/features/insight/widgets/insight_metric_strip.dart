import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class InsightMetricStrip extends StatelessWidget {
  const InsightMetricStrip({super.key, required this.analysis});

  final MuscleAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const ValueKey('insight-metric-strip'),
      children: [
        Expanded(
          child: _MetricTile(
            label: 'VOLUME',
            value: '${(analysis.volume / 1000).toStringAsFixed(1)}k',
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _MetricTile(
            label: 'RPE',
            value: analysis.rpe.toStringAsFixed(1),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _MetricTile(
            label: 'TREND',
            value: '${analysis.trendPercent.toStringAsFixed(0)}%',
          ),
        ),
      ],
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.labelUppercase),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: AppTypography.statMedium.copyWith(color: AppColors.textDark),
          ),
        ],
      ),
    );
  }
}
