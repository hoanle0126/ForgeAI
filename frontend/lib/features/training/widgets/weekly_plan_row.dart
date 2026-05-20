import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class WeeklyPlanRow extends StatelessWidget {
  const WeeklyPlanRow({super.key, required this.statusLabel});

  final String statusLabel;

  static const _days = [
    _TrainingDay(label: 'Mo', date: '28', status: 'Upper', isToday: true),
    _TrainingDay(label: 'Tu', date: '29', status: 'Rest'),
    _TrainingDay(label: 'We', date: '30', status: 'Lower'),
    _TrainingDay(label: 'Th', date: '01', status: 'Zone'),
    _TrainingDay(label: 'Fr', date: '02', status: 'Full'),
    _TrainingDay(label: 'Sa', date: '03', status: 'Mob'),
    _TrainingDay(label: 'Su', date: '04', status: 'Rest'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Weekly Plan', style: AppTypography.h3),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: _days
              .map(
                (day) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.xs),
                    child: _DayChip(day: day, statusLabel: statusLabel),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _TrainingDay {
  const _TrainingDay({
    required this.label,
    required this.date,
    required this.status,
    this.isToday = false,
  });

  final String label;
  final String date;
  final String status;
  final bool isToday;
}

class _DayChip extends StatelessWidget {
  const _DayChip({required this.day, required this.statusLabel});

  final _TrainingDay day;
  final String statusLabel;

  @override
  Widget build(BuildContext context) {
    final background = day.isToday
        ? AppColors.sportOrange
        : AppColors.cardWhite;
    final labelColor = day.isToday ? AppColors.cardWhite : AppColors.textDark;
    final statusColor = day.isToday
        ? AppColors.cardWhite
        : AppColors.textDisabled;
    final displayStatus = day.isToday ? statusLabel : day.status;

    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: day.isToday ? null : Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day.label,
            style: AppTypography.labelUppercase.copyWith(color: labelColor),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            day.date,
            style: AppTypography.statSmall.copyWith(color: labelColor),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            displayStatus,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.label.copyWith(
              color: statusColor,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
