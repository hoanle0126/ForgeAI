import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/providers/exercise_create_provider.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_option_group.dart';
import 'package:forge_ai/features/workout_create/widgets/workout_form_field.dart';

class ExerciseCreateDetailSection extends StatelessWidget {
  const ExerciseCreateDetailSection({
    super.key,
    required this.instructionsController,
    required this.safetyNotesController,
    required this.videoUrlController,
    required this.imageUrlController,
    required this.state,
    required this.onEquipmentChanged,
    required this.onDifficultyChanged,
    required this.onInstructionsChanged,
    required this.onSafetyNotesChanged,
    required this.onVideoUrlChanged,
    required this.onImageUrlChanged,
    required this.onVisibilityChanged,
  });

  final TextEditingController instructionsController;
  final TextEditingController safetyNotesController;
  final TextEditingController videoUrlController;
  final TextEditingController imageUrlController;
  final ExerciseCreateState state;
  final void Function(String) onEquipmentChanged;
  final void Function(String) onDifficultyChanged;
  final void Function(String) onInstructionsChanged;
  final void Function(String) onSafetyNotesChanged;
  final void Function(String) onVideoUrlChanged;
  final void Function(String) onImageUrlChanged;
  final void Function(String) onVisibilityChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ExerciseOptionGroup(
          label: 'EQUIPMENT',
          options: exerciseEquipmentOptions,
          selectedOptions: [state.equipment],
          onOptionPressed: onEquipmentChanged,
        ),
        const SizedBox(height: AppSpacing.base),
        ExerciseOptionGroup(
          label: 'DIFFICULTY',
          options: exerciseDifficultyOptions,
          selectedOptions: [state.difficulty],
          onOptionPressed: onDifficultyChanged,
        ),
        const SizedBox(height: AppSpacing.base),
        WorkoutFormField(
          label: 'INSTRUCTIONS (OPTIONAL)',
          hint: 'One coaching cue per line',
          helperText: 'Each line becomes a step for the exercise.',
          controller: instructionsController,
          onChanged: onInstructionsChanged,
          maxLines: 4,
        ),
        const SizedBox(height: AppSpacing.base),
        WorkoutFormField(
          label: 'SAFETY NOTES (OPTIONAL)',
          hint: 'One caution per line',
          controller: safetyNotesController,
          onChanged: onSafetyNotesChanged,
          maxLines: 3,
        ),
        const SizedBox(height: AppSpacing.base),
        ExerciseOptionGroup(
          label: 'VISIBILITY',
          helperText:
              'Private stays in your library. Public can be reused by the community later.',
          options: exerciseVisibilityOptions,
          selectedOptions: [state.visibility],
          onOptionPressed: onVisibilityChanged,
        ),
        const SizedBox(height: AppSpacing.base),
        WorkoutFormField(
          label: 'VIDEO URL (OPTIONAL)',
          hint: 'https://...',
          controller: videoUrlController,
          onChanged: onVideoUrlChanged,
          keyboardType: TextInputType.url,
        ),
        const SizedBox(height: AppSpacing.base),
        WorkoutFormField(
          label: 'IMAGE URL (OPTIONAL)',
          hint: 'https://...',
          controller: imageUrlController,
          onChanged: onImageUrlChanged,
          keyboardType: TextInputType.url,
        ),
      ],
    );
  }
}
