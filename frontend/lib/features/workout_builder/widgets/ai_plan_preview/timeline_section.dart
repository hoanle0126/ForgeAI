import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/workout_builder/models/monthly_workout_plan.dart';
import 'package:forge_ai/features/workout_builder/widgets/ai_plan_preview/timeline_phase.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key, required this.plan});

  final AiMonthlyWorkoutPlan plan;

  @override
  Widget build(BuildContext context) {
    final weeks = plan.weeks;
    if (weeks.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        for (var index = 0; index < weeks.length; index++)
          TimelinePhase(
            phase: 'WEEK ${weeks[index].weekNumber}',
            title: weeks[index].focus,
            subtitle: _buildSubtitle(weeks[index]),
            description: weeks[index].progressionRule,
            color: _phaseColor(index, weeks[index].isDeload),
            isFirst: index == 0,
            isLast: index == weeks.length - 1,
          ),
      ],
    );
  }

  String _buildSubtitle(AiMonthlyPlanWeek week) {
    final trainingDays = week.days
        .where((day) => day.type == 'training')
        .length;
    final loadLabel = week.loadMultiplier.toStringAsFixed(2);
    if (week.isDeload) {
      return '$trainingDays sessions • Deload • ${week.targetSets} sets';
    }
    return '$trainingDays sessions • x$loadLabel load • ${week.targetSets} sets';
  }

  Color _phaseColor(int index, bool isDeload) {
    if (isDeload) {
      return AppColors.recovery;
    }

    const colors = [
      AppColors.sportOrange,
      AppColors.aiBlue,
      AppColors.success,
      AppColors.energy,
    ];
    return colors[index % colors.length];
  }
}
