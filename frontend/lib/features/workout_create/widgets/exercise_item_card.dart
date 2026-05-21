import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/widgets/add_set_button.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_header.dart';
import 'package:forge_ai/features/workout_create/widgets/set_header.dart';
import 'package:forge_ai/features/workout_create/widgets/set_row.dart';

class ExerciseItemCard extends StatelessWidget {
  const ExerciseItemCard({
    super.key,
    required this.item,
    required this.index,
    required this.onRemove,
    required this.onAddSet,
    required this.onRemoveSet,
    required this.onUpdateSet,
  });

  final WorkoutItem item;
  final int index;
  final VoidCallback onRemove;
  final VoidCallback onAddSet;
  final void Function(int setIndex) onRemoveSet;
  final void Function(int setIndex, WorkoutSet updatedSet) onUpdateSet;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.textDark.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExerciseHeader(
            index: index,
            name: item.exerciseName ?? 'Exercise',
            onRemove: onRemove,
          ),
          const Divider(height: 1, color: AppColors.border),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.base),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SetHeader(),
                const SizedBox(height: AppSpacing.md),
                ...item.sets.asMap().entries.map((entry) {
                  final setIndex = entry.key;
                  final set = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: SetRow(
                      set: set,
                      setNumber: setIndex + 1,
                      onUpdate: (updatedSet) =>
                          onUpdateSet(setIndex, updatedSet),
                      onRemove: () => onRemoveSet(setIndex),
                    ),
                  );
                }),
                const SizedBox(height: AppSpacing.xs),
                AddSetButton(onTap: onAddSet),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
