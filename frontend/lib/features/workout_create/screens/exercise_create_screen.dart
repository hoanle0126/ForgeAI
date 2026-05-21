import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_create/providers/exercise_create_provider.dart';
import 'package:forge_ai/features/workout_create/providers/workout_create_provider.dart';
import 'package:forge_ai/features/workout_create/screens/exercise_create_form.dart';
import 'package:forge_ai/features/workout_create/widgets/save_workout_button.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExerciseCreateScreen extends ConsumerStatefulWidget {
  const ExerciseCreateScreen({super.key});

  @override
  ConsumerState<ExerciseCreateScreen> createState() =>
      _ExerciseCreateScreenState();
}

class _ExerciseCreateScreenState extends ConsumerState<ExerciseCreateScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _instructionsController = TextEditingController();
  final _safetyNotesController = TextEditingController();
  final _videoUrlController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(exerciseCreateProvider.notifier).reset());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _instructionsController.dispose();
    _safetyNotesController.dispose();
    _videoUrlController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    final notifier = ref.read(exerciseCreateProvider.notifier)
      ..updateName(_nameController.text)
      ..updateDescription(_descriptionController.text)
      ..updateInstructions(_instructionsController.text)
      ..updateSafetyNotes(_safetyNotesController.text)
      ..updateVideoUrl(_videoUrlController.text)
      ..updateImageUrl(_imageUrlController.text);

    final exercise = await notifier.saveExercise();
    if (!mounted || exercise == null) return;

    ref.read(workoutCreateProvider.notifier).cacheExercise(exercise);
    context.pop(exercise);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(exerciseCreateProvider);
    final notifier = ref.read(exerciseCreateProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      appBar: AppBar(
        backgroundColor: AppColors.warmIvory,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: PhosphorIcon(
            PhosphorIcons.caretLeft(),
            color: AppColors.textDark,
          ),
        ),
        title: Text('Add Exercise', style: AppTypography.h4),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ExerciseCreateForm(
                nameController: _nameController,
                descriptionController: _descriptionController,
                instructionsController: _instructionsController,
                safetyNotesController: _safetyNotesController,
                videoUrlController: _videoUrlController,
                imageUrlController: _imageUrlController,
                state: state,
                onNameChanged: notifier.updateName,
                onDescriptionChanged: notifier.updateDescription,
                onMuscleGroupPressed: notifier.toggleMuscleGroup,
                onEquipmentChanged: notifier.updateEquipment,
                onDifficultyChanged: notifier.updateDifficulty,
                onInstructionsChanged: notifier.updateInstructions,
                onSafetyNotesChanged: notifier.updateSafetyNotes,
                onVideoUrlChanged: notifier.updateVideoUrl,
                onImageUrlChanged: notifier.updateImageUrl,
                onVisibilityChanged: notifier.updateVisibility,
              ),
            ),
            SaveWorkoutButton(
              text: 'Save Exercise',
              isSaving: state.isSaving,
              onSave: _handleSave,
            ),
          ],
        ),
      ),
    );
  }
}
