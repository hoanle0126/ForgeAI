import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/providers/workout_create_provider.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_list.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_search_field.dart';
import 'package:forge_ai/features/workout_create/widgets/selector_sheet_header.dart';
import 'package:forge_ai/features/workout_create/widgets/sheet_drag_handle.dart';
import 'package:go_router/go_router.dart';

class ExerciseSelectorSheet extends ConsumerStatefulWidget {
  const ExerciseSelectorSheet({super.key, required this.routeContext});

  final BuildContext routeContext;

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (sheetContext) => ExerciseSelectorSheet(routeContext: context),
    );
  }

  @override
  ConsumerState<ExerciseSelectorSheet> createState() =>
      _ExerciseSelectorSheetState();
}

class _ExerciseSelectorSheetState extends ConsumerState<ExerciseSelectorSheet> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(workoutCreateProvider.notifier).loadExercises();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workoutCreateProvider);
    final filteredExercises = state.availableExercises.where((exercise) {
      if (_searchQuery.isEmpty) return true;
      return exercise.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: AppColors.warmIvory,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.md),
          const SheetDragHandle(),
          const SizedBox(height: AppSpacing.lg),
          SelectorSheetHeader(onCreateExercise: _openCreateExercise),
          const SizedBox(height: AppSpacing.base),
          ExerciseSearchField(
            controller: _searchController,
            onChanged: (value) => setState(() => _searchQuery = value),
          ),
          const SizedBox(height: AppSpacing.base),
          Expanded(
            child: ExerciseList(
              isLoading: state.isLoadingExercises,
              exercises: filteredExercises,
              onExerciseSelected: (exercise) {
                ref.read(workoutCreateProvider.notifier).addExercise(exercise);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openCreateExercise() async {
    final container = ProviderScope.containerOf(
      widget.routeContext,
      listen: false,
    );
    Navigator.of(context).pop();
    if (!widget.routeContext.mounted) return;

    final exercise = await widget.routeContext.push<Exercise>(
      AppRoutes.exerciseCreate,
    );
    if (exercise == null || !widget.routeContext.mounted) return;

    container.read(workoutCreateProvider.notifier).addCreatedExercise(exercise);
  }
}
