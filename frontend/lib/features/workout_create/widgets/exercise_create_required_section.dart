import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/providers/exercise_create_provider.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_option_group.dart';
import 'package:forge_ai/features/workout_create/widgets/workout_form_field.dart';

class ExerciseCreateRequiredSection extends StatelessWidget {
  const ExerciseCreateRequiredSection({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.state,
    required this.onNameChanged,
    required this.onDescriptionChanged,
    required this.onMuscleGroupPressed,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final ExerciseCreateState state;
  final void Function(String) onNameChanged;
  final void Function(String) onDescriptionChanged;
  final void Function(String) onMuscleGroupPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WorkoutFormField(
          label: 'EXERCISE NAME',
          hint: 'e.g., Goblet squat',
          controller: nameController,
          onChanged: onNameChanged,
          errorText: state.errorMessage?.contains('name') == true
              ? state.errorMessage
              : null,
        ),
        const SizedBox(height: AppSpacing.base),
        WorkoutFormField(
          label: 'DESCRIPTION (OPTIONAL)',
          hint: 'What makes this exercise useful?',
          controller: descriptionController,
          onChanged: onDescriptionChanged,
          maxLines: 3,
        ),
        const SizedBox(height: AppSpacing.base),
        ExerciseOptionGroup(
          label: 'MUSCLE GROUPS',
          helperText: 'Choose every area this exercise meaningfully trains.',
          options: exerciseMuscleGroupOptions,
          selectedOptions: state.muscleGroups,
          onOptionPressed: onMuscleGroupPressed,
          multiSelect: true,
        ),
      ],
    );
  }
}
