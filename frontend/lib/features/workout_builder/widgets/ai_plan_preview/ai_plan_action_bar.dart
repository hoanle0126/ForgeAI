import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/training/providers/training_workout_provider.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_plan_provider.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class AiPlanActionBar extends ConsumerWidget {
  const AiPlanActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthlyPlanAsync = ref.watch(monthlyWorkoutPlanProvider);
    final updateAsync = ref.watch(monthlyWorkoutSyncProvider);
    final isUpdating = updateAsync.isLoading;
    final templateDrafts = monthlyPlanAsync.maybeWhen(
      data: (planResult) => planResult.workoutTemplateDrafts,
      orElse: () => const <Map<String, dynamic>>[],
    );
    final canUpdateWorkouts = templateDrafts.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: AppSpacing.xl,
        top: AppSpacing.base,
      ),
      child: AppButton(
        text: canUpdateWorkouts ? 'Update Workouts' : 'Back to Training',
        trailingIcon: canUpdateWorkouts ? Icons.sync : Icons.bolt,
        isLoading: isUpdating,
        onPressed: isUpdating
            ? null
            : () async {
                if (!canUpdateWorkouts) {
                  context.go(AppRoutes.training);
                  return;
                }

                await ref
                    .read(monthlyWorkoutSyncProvider.notifier)
                    .updateWorkouts(workoutTemplateDrafts: templateDrafts);
                if (!context.mounted) return;

                final nextState = ref.read(monthlyWorkoutSyncProvider);
                if (nextState.hasError) {
                  final message = buildMonthlyWorkoutTemplateUpdateErrorMessage(
                    nextState.error!,
                  );
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message)));
                  return;
                }

                ref
                  ..invalidate(workoutLibraryProvider)
                  ..invalidate(trainingWorkoutProvider);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Workouts updated successfully'),
                  ),
                );
                context.go(AppRoutes.training);
              },
      ),
    );
  }
}
