import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_create_detail_section.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_create_error_banner.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_create_header_card.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_create_required_section.dart';

class ExerciseCreateForm extends StatelessWidget {
  const ExerciseCreateForm({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.instructionsController,
    required this.safetyNotesController,
    required this.videoUrlController,
    required this.imageUrlController,
    required this.state,
    required this.onNameChanged,
    required this.onDescriptionChanged,
    required this.onMuscleGroupPressed,
    required this.onEquipmentChanged,
    required this.onDifficultyChanged,
    required this.onInstructionsChanged,
    required this.onSafetyNotesChanged,
    required this.onVideoUrlChanged,
    required this.onImageUrlChanged,
    required this.onVisibilityChanged,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController instructionsController;
  final TextEditingController safetyNotesController;
  final TextEditingController videoUrlController;
  final TextEditingController imageUrlController;
  final ExerciseCreateState state;
  final void Function(String) onNameChanged;
  final void Function(String) onDescriptionChanged;
  final void Function(String) onMuscleGroupPressed;
  final void Function(String) onEquipmentChanged;
  final void Function(String) onDifficultyChanged;
  final void Function(String) onInstructionsChanged;
  final void Function(String) onSafetyNotesChanged;
  final void Function(String) onVideoUrlChanged;
  final void Function(String) onImageUrlChanged;
  final void Function(String) onVisibilityChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.base),
          const ExerciseCreateHeaderCard(),
          const SizedBox(height: AppSpacing.lg),
          if (state.errorMessage != null) ...[
            ExerciseCreateErrorBanner(message: state.errorMessage!),
            const SizedBox(height: AppSpacing.base),
          ],
          ExerciseCreateRequiredSection(
            nameController: nameController,
            descriptionController: descriptionController,
            state: state,
            onNameChanged: onNameChanged,
            onDescriptionChanged: onDescriptionChanged,
            onMuscleGroupPressed: onMuscleGroupPressed,
          ),
          const SizedBox(height: AppSpacing.lg),
          ExerciseCreateDetailSection(
            instructionsController: instructionsController,
            safetyNotesController: safetyNotesController,
            videoUrlController: videoUrlController,
            imageUrlController: imageUrlController,
            state: state,
            onEquipmentChanged: onEquipmentChanged,
            onDifficultyChanged: onDifficultyChanged,
            onInstructionsChanged: onInstructionsChanged,
            onSafetyNotesChanged: onSafetyNotesChanged,
            onVideoUrlChanged: onVideoUrlChanged,
            onImageUrlChanged: onImageUrlChanged,
            onVisibilityChanged: onVisibilityChanged,
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}
