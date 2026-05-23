import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/widgets/picker_sheet.dart';

class WorkoutMetadataPickers {
  static Future<WorkoutDifficulty?> showDifficultyPicker(
    BuildContext context,
    WorkoutDifficulty? current,
  ) async {
    return showModalBottomSheet<WorkoutDifficulty>(
      context: context,
      backgroundColor: AppColors.warmIvory,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusLg),
        ),
      ),
      builder: (context) => PickerSheet(
        title: 'Select Difficulty',
        items: WorkoutDifficulty.values,
        itemBuilder: (item) => item.label,
        selectedItem: current,
      ),
    );
  }

  static Future<WorkoutGoal?> showGoalPicker(
    BuildContext context,
    WorkoutGoal? current,
  ) async {
    return showModalBottomSheet<WorkoutGoal>(
      context: context,
      backgroundColor: AppColors.warmIvory,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusLg),
        ),
      ),
      builder: (context) => PickerSheet(
        title: 'Select Goal',
        items: WorkoutGoal.values,
        itemBuilder: (item) => item.label,
        selectedItem: current,
      ),
    );
  }

  static Future<void> showScheduleDaysPicker(
    BuildContext context, {
    required List<WorkoutScheduleDay> selectedDays,
    required void Function(WorkoutScheduleDay) onToggle,
  }) async {
    final localSelectedDays = Set<WorkoutScheduleDay>.from(selectedDays);
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.warmIvory,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusLg),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.base),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select Training Days', style: AppTypography.h4),
                    const SizedBox(height: AppSpacing.base),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: WorkoutScheduleDay.values.map((day) {
                        final isSelected = localSelectedDays.contains(day);
                        return FilterChip(
                          label: Text(day.shortLabel),
                          selected: isSelected,
                          selectedColor: AppColors.sportOrangeLight,
                          checkmarkColor: AppColors.sportOrange,
                          onSelected: (_) {
                            setState(() {
                              if (isSelected) {
                                localSelectedDays.remove(day);
                              } else {
                                localSelectedDays.add(day);
                              }
                            });
                            onToggle(day);
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Done',
                          style: AppTypography.bodySemiBold.copyWith(
                            color: AppColors.sportOrange,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
