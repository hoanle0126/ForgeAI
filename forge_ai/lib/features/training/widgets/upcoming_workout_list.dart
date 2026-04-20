import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UpcomingWorkoutList extends StatelessWidget {
  const UpcomingWorkoutList({super.key});

  static const _workouts = [
    _UpcomingWorkout(
      title: 'Lower Body',
      time: 'Wed - 38 min',
      detail: 'Squat pattern and posterior chain',
    ),
    _UpcomingWorkout(
      title: 'Zone 2 Cardio',
      time: 'Thu - 30 min',
      detail: 'Low-impact aerobic base',
    ),
    _UpcomingWorkout(
      title: 'Full Body Power',
      time: 'Fri - 45 min',
      detail: 'Compound strength circuit',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Up Next', style: AppTypography.h3),
        const SizedBox(height: AppSpacing.md),
        ..._workouts.map(
          (workout) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: _UpcomingWorkoutCard(workout: workout),
          ),
        ),
      ],
    );
  }
}

class _UpcomingWorkout {
  const _UpcomingWorkout({
    required this.title,
    required this.time,
    required this.detail,
  });

  final String title;
  final String time;
  final String detail;
}

class _UpcomingWorkoutCard extends StatelessWidget {
  const _UpcomingWorkoutCard({required this.workout});

  final _UpcomingWorkout workout;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Row(
        children: [
          Container(
            width: AppSpacing.xxxl,
            height: AppSpacing.xxxl,
            decoration: BoxDecoration(
              color: AppColors.sportOrangeLight,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Icon(
              PhosphorIcons.barbell(PhosphorIconsStyle.bold),
              color: AppColors.sportOrange,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(workout.title, style: AppTypography.h4),
                const SizedBox(height: AppSpacing.xs),
                Text(workout.detail, style: AppTypography.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(workout.time, style: AppTypography.label),
        ],
      ),
    );
  }
}
