import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/providers/training_workout_provider.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/workout_create/providers/workout_create_provider.dart';
import 'package:forge_ai/features/workout_create/screens/workout_create_form.dart';
import 'package:forge_ai/features/workout_create/widgets/save_workout_button.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutCreateScreen extends ConsumerStatefulWidget {
  const WorkoutCreateScreen({super.key});

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
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _notesController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    final notifier = ref.read(workoutCreateProvider.notifier)
      ..updateTitle(_titleController.text)
      ..updateDescription(_descriptionController.text)
      ..updateNotes(_notesController.text);

    final success = await notifier.saveWorkout();

    if (!mounted) return;

    final state = ref.read(workoutCreateProvider);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? 'Workout saved successfully'
              : state.errorMessage ?? 'Failed to save',
        ),
        backgroundColor: success ? AppColors.success : AppColors.sportOrange,
      ),
    );

    if (success) {
      ref
        ..invalidate(workoutLibraryProvider)
        ..invalidate(trainingWorkoutProvider);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workoutCreateProvider);
    final notifier = ref.read(workoutCreateProvider.notifier);

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
        title: Text('Create Workout', style: AppTypography.h4),
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
                onScheduledForChanged: notifier.updateScheduledFor,
                onRemoveExercise: notifier.removeExercise,
                onAddSet: notifier.addSetToExercise,
                onRemoveSet: notifier.removeSetFromExercise,
                onUpdateSet: notifier.updateSet,
              ),
            ),
            SaveWorkoutButton(isSaving: state.isSaving, onSave: _handleSave),
          ],
        ),
      ),
    );
  }
}
