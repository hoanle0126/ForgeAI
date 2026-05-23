import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/workout_create/providers/workout_create_provider.dart';
import 'package:forge_ai/features/workout_create/screens/workout_create_form.dart';
import 'package:forge_ai/features/workout_create/screens/workout_create_save_handler.dart';
import 'package:forge_ai/features/workout_create/widgets/save_workout_button.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutCreateScreen extends ConsumerStatefulWidget {
  const WorkoutCreateScreen({super.key, this.editingWorkout});

  final WorkoutLibraryWorkout? editingWorkout;

  @override
  ConsumerState<WorkoutCreateScreen> createState() =>
      _WorkoutCreateScreenState();
}

class _WorkoutCreateScreenState extends ConsumerState<WorkoutCreateScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    final workout = widget.editingWorkout;
    _titleController = TextEditingController(text: workout?.title ?? '');
    _descriptionController = TextEditingController(
      text: workout?.description ?? '',
    );
    _notesController = TextEditingController(text: workout?.notes ?? '');
    Future.microtask(() {
      final notifier = ref.read(workoutCreateProvider.notifier)..reset();
      if (workout != null) notifier.loadForEditing(workout);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workoutCreateProvider);
    final notifier = ref.read(workoutCreateProvider.notifier);
    final isEditing = widget.editingWorkout != null;

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
        title: Text(
          isEditing ? 'Edit Workout' : 'Create Workout',
          style: AppTypography.h4,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: WorkoutCreateForm(
                titleController: _titleController,
                descriptionController: _descriptionController,
                notesController: _notesController,
                state: state,
                onDifficultyChanged: notifier.updateDifficulty,
                onGoalChanged: notifier.updateGoal,
                onScheduledDayToggle: notifier.toggleScheduledDay,
                onRemoveExercise: notifier.removeExercise,
                onAddSet: notifier.addSetToExercise,
                onRemoveSet: notifier.removeSetFromExercise,
                onUpdateSet: notifier.updateSet,
              ),
            ),
            SaveWorkoutButton(
              isSaving: state.isSaving,
              onSave: () => handleWorkoutSave(
                context: context,
                ref: ref,
                titleController: _titleController,
                descriptionController: _descriptionController,
                notesController: _notesController,
              ),
              text: isEditing ? 'Update Workout' : 'Save Workout',
            ),
          ],
        ),
      ),
    );
  }
}
