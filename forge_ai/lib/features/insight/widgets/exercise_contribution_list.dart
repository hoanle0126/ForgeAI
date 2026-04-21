import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';

class ExerciseContributionList extends StatelessWidget {
  const ExerciseContributionList({super.key, required this.contributions});

  final List<ExerciseContribution> contributions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final contribution in contributions.take(3)) ...[
          Row(
            children: [
              Expanded(
                child: Text(
                  contribution.exerciseName,
                  style: AppTypography.bodySmall,
                ),
              ),
              Text(
                '${(contribution.volume / 1000).toStringAsFixed(1)}k',
                style: AppTypography.statSmall,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
      ],
    );
  }
}
