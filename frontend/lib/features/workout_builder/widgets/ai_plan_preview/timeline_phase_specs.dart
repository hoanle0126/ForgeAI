import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';

class TimelinePhaseSpec {
  const TimelinePhaseSpec(
    this.phase,
    this.title,
    this.subtitle,
    this.description,
    this.color,
  );

  final String phase;
  final String title;
  final String subtitle;
  final String description;
  final Color color;
}

List<TimelinePhaseSpec> buildTimelinePhaseSpecs(
  WorkoutGoal? goal,
  String frequencyLabel,
  int sessionLength,
) {
  return switch (goal) {
    WorkoutGoal.strength => [
      TimelinePhaseSpec(
        'PHASE 1',
        'Foundation',
        'Technique + brace',
        'Build repeatable movement patterns across $frequencyLabel with $sessionLength-minute sessions.',
        AppColors.sportOrange,
      ),
      const TimelinePhaseSpec(
        'PHASE 2',
        'Build',
        'Heavy compound work',
        'Push load progression without wasting volume so each session stays crisp and recoverable.',
        AppColors.aiBlue,
      ),
      const TimelinePhaseSpec(
        'PHASE 3',
        'Peak',
        'High-output week',
        'Tighten intensity, keep accessories lean, and arrive fresh for your hardest sets.',
        AppColors.success,
      ),
    ],
    WorkoutGoal.muscleGain => [
      const TimelinePhaseSpec(
        'PHASE 1',
        'Foundation',
        'Movement quality',
        'Establish stable ranges and enough weekly volume to grow without burying recovery.',
        AppColors.sportOrange,
      ),
      const TimelinePhaseSpec(
        'PHASE 2',
        'Build',
        'Hypertrophy block',
        'Bias the plan toward repeatable sets, controlled tempo, and smarter exercise density.',
        AppColors.aiBlue,
      ),
      const TimelinePhaseSpec(
        'PHASE 3',
        'Peak',
        'Volume refinement',
        'Keep the best builders, trim fatigue, and make each session count.',
        AppColors.success,
      ),
    ],
    WorkoutGoal.fatLoss => [
      const TimelinePhaseSpec(
        'PHASE 1',
        'Foundation',
        'Consistency first',
        'Start with realistic volume and conditioning so the plan fits your week before intensity climbs.',
        AppColors.sportOrange,
      ),
      const TimelinePhaseSpec(
        'PHASE 2',
        'Build',
        'Work-capacity',
        'Blend full-body lifting and short finishers to increase output without killing adherence.',
        AppColors.aiBlue,
      ),
      const TimelinePhaseSpec(
        'PHASE 3',
        'Peak',
        'Metabolic efficiency',
        'Keep momentum high with short recoveries and tighter session pacing.',
        AppColors.success,
      ),
    ],
    WorkoutGoal.mobility => [
      const TimelinePhaseSpec(
        'PHASE 1',
        'Foundation',
        'Joint control',
        'Restore usable range and smooth patterns before loading anything aggressively.',
        AppColors.sportOrange,
      ),
      const TimelinePhaseSpec(
        'PHASE 2',
        'Build',
        'Range + stability',
        'Pair mobility work with light strength so new positions stay strong and repeatable.',
        AppColors.aiBlue,
      ),
      const TimelinePhaseSpec(
        'PHASE 3',
        'Peak',
        'Resilient movement',
        'Turn the better range into confident movement under normal weekly fatigue.',
        AppColors.success,
      ),
    ],
    WorkoutGoal.generalFitness || null => [
      TimelinePhaseSpec(
        'PHASE 1',
        'Foundation',
        'Weekly rhythm',
        'ForgeAI starts from $frequencyLabel and builds around sessions you can finish consistently.',
        AppColors.sportOrange,
      ),
      const TimelinePhaseSpec(
        'PHASE 2',
        'Build',
        'Full-body progression',
        'Balance strength, conditioning, and recoverable volume so the plan stays practical.',
        AppColors.aiBlue,
      ),
      const TimelinePhaseSpec(
        'PHASE 3',
        'Peak',
        'Sustainable output',
        'Sharpen effort without turning the week into a grind you cannot repeat.',
        AppColors.success,
      ),
    ],
  };
}
