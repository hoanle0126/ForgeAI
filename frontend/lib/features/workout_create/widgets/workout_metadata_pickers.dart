import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => PickerSheet(
        title: 'Select Goal',
        items: WorkoutGoal.values,
        itemBuilder: (item) => item.label,
        selectedItem: current,
      ),
    );
  }

  static Future<DateTime?> showScheduleDatePicker(
    BuildContext context,
    DateTime? current,
  ) async {
    return showDatePicker(
      context: context,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
  }
}
