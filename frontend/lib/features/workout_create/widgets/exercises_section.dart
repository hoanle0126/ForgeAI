import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_item_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExercisesSection extends StatelessWidget {
  const ExercisesSection({
    super.key,
    required this.items,
    required this.onAddExercise,
    required this.onRemoveExercise,
    required this.onAddSet,
    required this.onRemoveSet,
    required this.onUpdateSet,
  });

  final List<WorkoutItem> items;
  final VoidCallback onAddExercise;
  final void Function(int index) onRemoveExercise;
  final void Function(int index) onAddSet;
  final void Function(int itemIndex, int setIndex) onRemoveSet;
  final void Function(int itemIndex, int setIndex, WorkoutSet updatedSet)
  onUpdateSet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'EXERCISES',
              style: AppTypography.label.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextButton.icon(
              onPressed: onAddExercise,
              icon: PhosphorIcon(
                PhosphorIcons.plus(),
                color: AppColors.sportOrange,
                size: 18,
              ),
              label: Text(
                'Add Exercise',
                style: AppTypography.bodySemiBold.copyWith(
                  color: AppColors.sportOrange,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        if (items.isEmpty)
          Container(
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                PhosphorIcon(
                  PhosphorIcons.barbell(),
                  color: AppColors.textDisabled,
                  size: 48,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'No exercises added yet',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Tap "Add Exercise" to get started',
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          )
        else
          ...items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.base),
              child: ExerciseItemCard(
                item: item,
                index: index,
                onRemove: () => onRemoveExercise(index),
                onAddSet: () => onAddSet(index),
                onRemoveSet: (setIndex) => onRemoveSet(index, setIndex),
                onUpdateSet: (setIndex, updatedSet) =>
                    onUpdateSet(index, setIndex, updatedSet),
              ),
            );
          }),
      ],
    );
  }
}
