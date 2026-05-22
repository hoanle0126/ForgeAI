import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_builder/models/monthly_workout_plan.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class MonthlyTemplateList extends StatelessWidget {
  const MonthlyTemplateList({super.key, required this.plan});

  final AiMonthlyWorkoutPlan plan;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'SESSION TEMPLATES',
          style: AppTypography.labelUppercase.copyWith(
            color: AppColors.textDisabled,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        for (var index = 0; index < plan.templateWorkouts.length; index++) ...[
          _TemplateCard(template: plan.templateWorkouts[index]),
          if (index < plan.templateWorkouts.length - 1)
            const SizedBox(height: AppSpacing.md),
        ],
      ],
    );
  }
}

class _TemplateCard extends StatelessWidget {
  const _TemplateCard({required this.template});

  final AiTemplateWorkout template;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(template.title, style: AppTypography.h4)),
              Text(
                '${template.estimatedMinutes} min',
                style: AppTypography.statSmall.copyWith(
                  color: AppColors.sportOrange,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            template.focus,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            _exercisePreview(template),
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textDark.withValues(alpha: 0.82),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  String _exercisePreview(AiTemplateWorkout template) {
    final exerciseTitles = template.exercises
        .map((item) => item.title)
        .toList();
    if (exerciseTitles.length <= 3) {
      return exerciseTitles.join(' • ');
    }

    final visible = exerciseTitles.take(3).join(' • ');
    final remaining = exerciseTitles.length - 3;
    return '$visible +$remaining more';
  }
}
