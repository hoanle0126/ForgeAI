import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/dashboard/widgets/home/weekly_day_indicator.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class WeeklyProgressRow extends ConsumerWidget {
  const WeeklyProgressRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutsAsync = ref.watch(workoutLibraryProvider);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('This Week', style: AppTypography.h3.copyWith(fontSize: 16)),
          const SizedBox(height: AppSpacing.base),
          workoutsAsync.maybeWhen(
            data: (workouts) {
              final now = DateTime.now();
              final todayWeekday = now.weekday; // 1 = Mon, ..., 7 = Sun

              final completedWeekdays = <int>{};
              for (final workout in workouts) {
                if (workout.status == TrainingWorkoutStatus.completed) {
                  final completedAt = workout.updatedAt?.toLocal();
                  if (completedAt != null && _isCurrentWeek(completedAt)) {
                    completedWeekdays.add(completedAt.weekday);
                  }
                }
              }

              const dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  final dayIndex = index + 1;
                  final isDone = completedWeekdays.contains(dayIndex);
                  final isToday = dayIndex == todayWeekday;

                  return WeeklyDayIndicator(
                    day: dayLabels[index],
                    isDone: isDone,
                    isToday: isToday,
                  );
                }),
              );
            },
            orElse: () {
              final todayWeekday = DateTime.now().weekday;
              const dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  final dayIndex = index + 1;
                  return WeeklyDayIndicator(
                    day: dayLabels[index],
                    isDone: false,
                    isToday: dayIndex == todayWeekday,
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

bool _isCurrentWeek(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final weekStart = today.subtract(Duration(days: today.weekday - 1));
  final weekEndExclusive = weekStart.add(
    const Duration(days: DateTime.daysPerWeek),
  );
  final target = DateTime(date.year, date.month, date.day);
  return !target.isBefore(weekStart) && target.isBefore(weekEndExclusive);
}
