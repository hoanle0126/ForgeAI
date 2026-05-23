import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';
import 'package:forge_ai/features/workout_builder/widgets/goal_selection/goal_card.dart';

class WorkoutGoalList extends ConsumerWidget {
  const WorkoutGoalList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGoal = ref.watch(selectedWorkoutGoalProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: WorkoutGoal.values.map((goal) {
        return GoalCard(
              title: goal.title,
              subtitle: goal.subtitle,
              icon: goal.icon,
              isSelected: selectedGoal == goal,
              onTap: () =>
                  ref.read(selectedWorkoutGoalProvider.notifier).select(goal),
            )
            .animate()
            .fadeIn(delay: Duration(milliseconds: 200 + goal.index * 100))
            .slideX(begin: 0.1, end: 0);
      }).toList(),
    );
  }
}
