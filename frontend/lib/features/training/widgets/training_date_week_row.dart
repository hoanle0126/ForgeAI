import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/training/widgets/training_date_chip.dart';

class TrainingDateWeekRow extends StatelessWidget {
  const TrainingDateWeekRow({
    super.key,
    required this.dates,
    required this.statuses,
    required this.weekdays,
    required this.selectedDate,
    required this.onDateSelected,
  });

  final List<DateTime> dates;
  final List<String> statuses;
  final List<String> weekdays;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < dates.length; index++) ...[
          Expanded(
            child: TrainingDateChip(
              weekdayLabel: weekdays[index],
              dayLabel: dates[index].day.toString(),
              statusLabel: statuses[index],
              isSelected: _isSameDay(dates[index], selectedDate),
              isToday: _isSameDay(dates[index], DateTime.now()),
              onTap: () => onDateSelected(dates[index]),
            ),
          ),
          if (index != dates.length - 1) const SizedBox(width: AppSpacing.xs),
        ],
      ],
    );
  }

  bool _isSameDay(DateTime left, DateTime right) {
    return left.year == right.year &&
        left.month == right.month &&
        left.day == right.day;
  }
}
