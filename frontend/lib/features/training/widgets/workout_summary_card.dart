import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/widgets/metric_pill.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class WorkoutSummaryCard extends StatelessWidget {
  const WorkoutSummaryCard({super.key, required this.plan});

  final TrainingWorkoutPlan plan;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TODAY'S WORKOUT",
            style: AppTypography.labelUppercase.copyWith(
              color: AppColors.sportOrange,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(plan.title, style: AppTypography.h2),
          const SizedBox(height: AppSpacing.base),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              MetricPill(label: plan.durationLabel),
              MetricPill(label: plan.exerciseCountLabel),
              MetricPill(label: plan.intensityLabel),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            plan.equipment.join(' · '),
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
