import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/widgets/training_date_summary_card.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';

class TrainingDatePickerContent extends StatelessWidget {
  const TrainingDatePickerContent({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.selectedDate,
    required this.dateLabel,
    required this.status,
    required this.onDateSelected,
    required this.onSelectDate,
  });

  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime selectedDate;
  final String dateLabel;
  final String status;
  final ValueChanged<DateTime> onDateSelected;
  final VoidCallback onSelectDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.base,
        AppSpacing.md,
        AppSpacing.base,
        AppSpacing.lg,
      ),
      decoration: const BoxDecoration(
        color: AppColors.warmIvory,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(child: _SheetHandle()),
            const SizedBox(height: AppSpacing.base),
            Text('Choose training date', style: AppTypography.h2),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Jump into the day your plan needs right now.',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('Calendar View', style: AppTypography.labelUppercase),
            const SizedBox(height: AppSpacing.md),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                border: Border.all(color: AppColors.border),
              ),
              child: CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: firstDate,
                lastDate: lastDate,
                onDateChanged: onDateSelected,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            TrainingDateSummaryCard(dateLabel: dateLabel, status: status),
            const SizedBox(height: AppSpacing.lg),
            AppButton(text: 'Select Date', onPressed: onSelectDate),
          ],
        ),
      ),
    );
  }
}

class _SheetHandle extends StatelessWidget {
  const _SheetHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.xxl,
      height: AppSpacing.xs,
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
    );
  }
}
