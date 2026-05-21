import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';

typedef WeeklyPlanDayData = ({
  String label,
  String date,
  DateTime value,
  String status,
  bool isToday,
  bool hasWorkout,
  List<TrainingWorkoutPlan> plans,
});

List<WeeklyPlanDayData> buildWeeklyPlanDays(
  DateTime startDate,
  List<TrainingWorkoutPlan> plans,
) {
  return List.generate(7, (index) {
    final date = DateTime(
      startDate.year,
      startDate.month,
      startDate.day + index,
    );
    final dayPlans = _plansForDate(plans, date, startDate);
    return (
      label: weeklyPlanWeekdayLabel(date.weekday),
      date: date.day.toString().padLeft(2, '0'),
      value: date,
      status: weeklyPlanDayStatus(dayPlans),
      isToday: isSameDate(date, startDate),
      hasWorkout: dayPlans.isNotEmpty,
      plans: dayPlans,
    );
  });
}

Color weeklyPlanStatusColor(String status) {
  final normalized = status.toLowerCase();
  if (normalized.contains('rest') || normalized.contains('recovery')) {
    return AppColors.recovery;
  }
  if (normalized.contains('lower') || normalized.contains('full')) {
    return AppColors.success;
  }
  if (normalized.contains('zone') || normalized.contains('mob')) {
    return AppColors.aiBlue;
  }
  return AppColors.sportOrange;
}

String weeklyPlanDetailTitle(WeeklyPlanDayData day) {
  if (day.isToday && !day.hasWorkout) return 'No workout today';
  if (day.hasWorkout) return 'Workout scheduled';
  return 'No workout scheduled';
}

String weeklyPlanEmptySubtitle(WeeklyPlanDayData day) {
  if (day.isToday) {
    return 'Today has no workout scheduled. Keep it light or create one for today.';
  }
  return '${day.label} ${day.date} is open. Keep it light or create a workout for this date.';
}

String weeklyPlanWorkoutSubtitle(TrainingWorkoutPlan plan) {
  return '${plan.statusLabel} • ${plan.exerciseCountLabel} • ${plan.durationLabel}';
}

String weeklyPlanDayStatus(List<TrainingWorkoutPlan> plans) {
  if (plans.isEmpty) return '';
  if (plans.length == 1) return plans.first.statusLabel;
  return '${plans.length} plans';
}

List<TrainingWorkoutPlan> _plansForDate(
  List<TrainingWorkoutPlan> plans,
  DateTime date,
  DateTime fallbackToday,
) {
  final dayPlans = <TrainingWorkoutPlan>[];
  for (final plan in plans) {
    final workoutDate = resolveWeeklyPlanWorkoutDate(plan, fallbackToday);
    if (workoutDate != null && isSameDate(date, workoutDate)) {
      dayPlans.add(plan);
    }
  }
  return dayPlans;
}

DateTime? resolveWeeklyPlanWorkoutDate(
  TrainingWorkoutPlan plan,
  DateTime fallbackToday,
) {
  final scheduled = plan.scheduledFor?.toLocal();
  if (scheduled != null) {
    return DateTime(scheduled.year, scheduled.month, scheduled.day);
  }

  return plan.estimatedDateLabel == 'Today'
      ? DateTime(fallbackToday.year, fallbackToday.month, fallbackToday.day)
      : null;
}

String weeklyPlanWeekdayLabel(int weekday) {
  return switch (weekday) {
    DateTime.monday => 'Mo',
    DateTime.tuesday => 'Tu',
    DateTime.wednesday => 'We',
    DateTime.thursday => 'Th',
    DateTime.friday => 'Fr',
    DateTime.saturday => 'Sa',
    DateTime.sunday => 'Su',
    _ => 'Mo',
  };
}

bool isSameDate(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
