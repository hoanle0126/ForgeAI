import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/training_statistics_models.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class TrainingStatisticsDistributionCard extends StatelessWidget {
  const TrainingStatisticsDistributionCard({
    super.key,
    required this.title,
    required this.caption,
    required this.segments,
  });

  final String title;
  final String caption;
  final List<TrainingStatisticsSegment> segments;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.h4),
          const SizedBox(height: AppSpacing.xs),
          Text(caption, style: AppTypography.bodySmall),
          const SizedBox(height: AppSpacing.base),
          if (segments.isEmpty)
            Text(
              'Save a few focused workouts to reveal this mix.',
              style: AppTypography.bodySemiBold.copyWith(
                color: AppColors.textDark,
              ),
            )
          else
            for (final segment in segments.take(4).indexed) ...[
              _DistributionRow(
                segment: segment.$2,
                color: _segmentColor(segment.$1),
              ),
              if (segment.$1 != segments.take(4).length - 1)
                const SizedBox(height: AppSpacing.base),
            ],
        ],
      ),
    );
  }

  Color _segmentColor(int index) {
    return switch (index) {
      0 => AppColors.sportOrange,
      1 => AppColors.aiBlue,
      2 => AppColors.energy,
      _ => AppColors.recovery,
    };
  }
}

class _DistributionRow extends StatelessWidget {
  const _DistributionRow({required this.segment, required this.color});

  final TrainingStatisticsSegment segment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ratio = segment.ratio.clamp(0.0, 1.0).toDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(segment.label, style: AppTypography.bodySemiBold),
            ),
            Text('${segment.count}', style: AppTypography.statSmall),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Container(
          height: AppSpacing.sm,
          decoration: BoxDecoration(
            color: AppColors.inputBg,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          ),
          child: TweenAnimationBuilder<double>(
            duration: Durations.medium2,
            curve: Curves.easeOutCubic,
            tween: Tween(begin: 0, end: ratio),
            builder: (context, value, child) {
              return FractionallySizedBox(
                widthFactor: value,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
