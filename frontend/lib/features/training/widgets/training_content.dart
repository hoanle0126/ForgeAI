import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/widgets/today_workout_card.dart';
import 'package:forge_ai/features/training/widgets/training_header.dart';
import 'package:forge_ai/features/training/widgets/training_insight_card.dart';
import 'package:forge_ai/features/training/widgets/upcoming_workout_list.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_day_data.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_row.dart';
import 'package:forge_ai/features/training/widgets/workout_library_entry_card.dart';

class TrainingContent extends StatefulWidget {
  const TrainingContent({
    super.key,
    required this.plans,
    required this.onStartWorkout,
    required this.onOpenLibrary,
    required this.onCreateWorkout,
  });

  final List<TrainingWorkoutPlan> plans;
  final void Function(TrainingWorkoutPlan plan) onStartWorkout;
  final VoidCallback onOpenLibrary;
  final VoidCallback onCreateWorkout;

  @override
  State<TrainingContent> createState() => _TrainingContentState();
}

class _TrainingContentState extends State<TrainingContent> {
  TrainingWorkoutPlan? _selectedPlan;

  @override
  void initState() {
    super.initState();
    _selectedPlan = _todayPlan();
  }

  @override
  void didUpdateWidget(covariant TrainingContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    final selectedPlan = _selectedPlan;
    final stillExists =
        selectedPlan != null &&
        widget.plans.any((plan) => plan.id == selectedPlan.id);
    if (!stillExists) {
      _selectedPlan = _todayPlan();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: AppSpacing.md),
        const TrainingHeader(),
        const SizedBox(height: AppSpacing.lg),
        AnimatedSwitcher(
          duration: Durations.medium2,
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeOutCubic,
          child: _heroCard,
        ),
        const SizedBox(height: AppSpacing.lg),
        WorkoutLibraryEntryCard(
          onOpenLibrary: widget.onOpenLibrary,
          onCreateWorkout: widget.onCreateWorkout,
        ),
        const SizedBox(height: AppSpacing.lg),
        WeeklyPlanRow(
          plans: widget.plans,
          selectedPlanId: _selectedPlan?.id,
          onPlanSelected: _selectPlan,
        ),
        const SizedBox(height: AppSpacing.lg),
        UpcomingWorkoutList(currentPlan: _selectedPlan ?? widget.plans.first),
        const SizedBox(height: AppSpacing.sm),
        TrainingInsightCard(
          note:
              _selectedPlan?.aiNote ??
              'Today is open. Use it for recovery, mobility, or create a workout when you are ready.',
        ),
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }

  Widget get _heroCard {
    final selectedPlan = _selectedPlan;
    if (selectedPlan == null) {
      return TodayWorkoutCard.emptyToday(
        key: const ValueKey('empty-today-workout'),
        onEmptyAction: widget.onCreateWorkout,
      );
    }

    return TodayWorkoutCard(
      key: ValueKey(selectedPlan.id),
      plan: selectedPlan,
      eyebrow: selectedPlan.estimatedDateLabel == 'Today'
          ? 'Today\'s Workout'
          : 'Selected Workout',
      onStartWorkout: () => widget.onStartWorkout(selectedPlan),
    );
  }

  TrainingWorkoutPlan? _todayPlan() {
    final today = DateTime.now();
    for (final plan in widget.plans) {
      final date = resolveWeeklyPlanWorkoutDate(plan, today);
      if (date != null && isSameDate(date, today)) return plan;
    }
    return null;
  }

  void _selectPlan(TrainingWorkoutPlan plan) =>
      setState(() => _selectedPlan = plan);
}
