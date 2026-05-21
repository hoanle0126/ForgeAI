import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_day_chip.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_day_data.dart';

class WeeklyPlanDayStrip extends StatelessWidget {
  const WeeklyPlanDayStrip({
    super.key,
    required this.days,
    required this.selectedIndex,
    required this.onDaySelected,
  });

  final List<WeeklyPlanDayData> days;
  final int selectedIndex;
  final ValueChanged<int> onDaySelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: days.asMap().entries.map((entry) {
        final index = entry.key;
        final day = entry.value;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index == days.length - 1 ? 0 : AppSpacing.xs,
            ),
            child: WeeklyPlanDayChip(
              label: day.label,
              date: day.date,
              status: day.status,
              accentColor: day.hasWorkout
                  ? weeklyPlanStatusColor(day.status)
                  : null,
              isToday: day.isToday,
              hasWorkout: day.hasWorkout,
              isSelected: index == selectedIndex,
              onTap: () => onDaySelected(index),
            ),
          ),
        );
      }).toList(),
    );
  }
}
