import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_day_data.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_detail_card.dart';

class WeeklyPlanWorkoutList extends StatelessWidget {
  const WeeklyPlanWorkoutList({
    super.key,
    required this.day,
    required this.selectedPlanId,
    required this.onPlanSelected,
  });

  final WeeklyPlanDayData day;
  final String? selectedPlanId;
  final ValueChanged<TrainingWorkoutPlan> onPlanSelected;

  @override
  Widget build(BuildContext context) {
    if (!day.hasWorkout) {
      return WeeklyPlanDetailCard(
        key: ValueKey('empty-${day.value.toIso8601String()}'),
        title: weeklyPlanDetailTitle(day),
        subtitle: weeklyPlanEmptySubtitle(day),
        accentColor: day.isToday ? AppColors.sportOrange : null,
        hasWorkout: false,
      );
    }

    return Column(
      children: day.plans
          .map((plan) {
            final isSelected = plan.id == selectedPlanId;
            return Padding(
              padding: EdgeInsets.only(
                bottom: plan == day.plans.last ? 0 : AppSpacing.sm,
              ),
              child: WeeklyPlanDetailCard(
                key: ValueKey(plan.id),
                title: plan.title,
                subtitle: weeklyPlanWorkoutSubtitle(plan),
                accentColor: weeklyPlanStatusColor(plan.statusLabel),
                hasWorkout: true,
                isSelected: isSelected,
                onTap: () => onPlanSelected(plan),
              ),
            );
          })
          .toList(growable: false),
    );
  }
}
