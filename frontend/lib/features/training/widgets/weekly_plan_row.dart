import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_day_data.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_day_strip.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_workout_list.dart';

class WeeklyPlanRow extends StatefulWidget {
  const WeeklyPlanRow({
    super.key,
    required this.plans,
    required this.selectedPlanId,
    required this.onPlanSelected,
    this.startDate,
  });

  final List<TrainingWorkoutPlan> plans;
  final String? selectedPlanId;
  final void Function(TrainingWorkoutPlan plan) onPlanSelected;
  final DateTime? startDate;

  @override
  State<WeeklyPlanRow> createState() => _WeeklyPlanRowState();
}

class _WeeklyPlanRowState extends State<WeeklyPlanRow> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = _indexForToday();
  }

  @override
  void didUpdateWidget(covariant WeeklyPlanRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.startDate != widget.startDate) {
      _selectedIndex = _indexForToday();
    }
  }

  @override
  Widget build(BuildContext context) {
    final days = buildWeeklyPlanDays(
      widget.startDate ?? DateTime.now(),
      widget.plans,
    );
    final selectedDay = days[_selectedIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text('Weekly Plan', style: AppTypography.h3)),
            Text(
              selectedDay.isToday ? 'Today' : selectedDay.label,
              style: AppTypography.labelUppercase.copyWith(
                color: selectedDay.isToday
                    ? AppColors.sportOrange
                    : selectedDay.hasWorkout
                    ? weeklyPlanStatusColor(selectedDay.status)
                    : AppColors.textMuted,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        WeeklyPlanDayStrip(
          days: days,
          selectedIndex: _selectedIndex,
          onDaySelected: _selectDay,
        ),
        const SizedBox(height: AppSpacing.md),
        WeeklyPlanWorkoutList(
          key: ValueKey(selectedDay.value.toIso8601String()),
          day: selectedDay,
          selectedPlanId: widget.selectedPlanId,
          onPlanSelected: widget.onPlanSelected,
        ),
      ],
    );
  }

  void _selectDay(int index) {
    setState(() => _selectedIndex = index);
  }

  int _indexForToday() {
    final days = buildWeeklyPlanDays(
      widget.startDate ?? DateTime.now(),
      widget.plans,
    );
    final index = days.indexWhere((day) => day.isToday);
    return index < 0 ? 0 : index;
  }
}
