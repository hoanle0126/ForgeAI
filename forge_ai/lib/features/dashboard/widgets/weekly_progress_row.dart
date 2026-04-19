import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class WeeklyProgressRow extends StatelessWidget {
  const WeeklyProgressRow({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('This Week', style: AppTypography.h3.copyWith(fontSize: 16)),
          const SizedBox(height: AppSpacing.base),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _WeeklyDayIndicator(day: 'M', isDone: true),
              _WeeklyDayIndicator(day: 'T', isDone: true),
              _WeeklyDayIndicator(day: 'W', isDone: true),
              _WeeklyDayIndicator(day: 'T', isToday: true),
              _WeeklyDayIndicator(day: 'F'),
              _WeeklyDayIndicator(day: 'S'),
              _WeeklyDayIndicator(day: 'S'),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeeklyDayIndicator extends StatelessWidget {
  const _WeeklyDayIndicator({
    required this.day,
    this.isDone = false,
    this.isToday = false,
  });

  final String day;
  final bool isDone;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: AppTypography.labelUppercase.copyWith(
            color: isToday || isDone
                ? AppColors.textDark
                : AppColors.textDisabled,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone
                ? AppColors.success
                : isToday
                ? AppColors.cardWhite
                : AppColors.border,
            border: isToday
                ? Border.all(color: AppColors.sportOrange, width: 3)
                : null,
          ),
          child: isDone
              ? const Icon(Icons.check, color: AppColors.cardWhite, size: 16)
              : isToday
              ? const Center(child: _TodayDot())
              : null,
        ),
      ],
    );
  }
}

class _TodayDot extends StatelessWidget {
  const _TodayDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.sm,
      height: AppSpacing.sm,
      decoration: const BoxDecoration(
        color: AppColors.sportOrange,
        shape: BoxShape.circle,
      ),
    );
  }
}
