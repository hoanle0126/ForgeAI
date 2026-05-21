import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/widgets/metadata_row.dart';
import 'package:forge_ai/features/workout_create/widgets/workout_metadata_pickers.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutMetadataSection extends StatelessWidget {
  const WorkoutMetadataSection({
    super.key,
    required this.difficulty,
    required this.goal,
    required this.scheduledFor,
    required this.onDifficultyChanged,
    required this.onGoalChanged,
    required this.onScheduledForChanged,
  });

  final WorkoutDifficulty? difficulty;
  final WorkoutGoal? goal;
  final DateTime? scheduledFor;
  final void Function(WorkoutDifficulty?) onDifficultyChanged;
  final void Function(WorkoutGoal?) onGoalChanged;
  final void Function(DateTime?) onScheduledForChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.base),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WORKOUT DETAILS',
            style: AppTypography.label.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          MetadataRow(
            label: 'Difficulty',
            value: difficulty?.label ?? 'Not set',
            icon: PhosphorIcons.gauge(),
            onTap: () => _handleDifficultyTap(context),
          ),
          const Divider(height: AppSpacing.lg),
          MetadataRow(
            label: 'Goal',
            value: goal?.label ?? 'Not set',
            icon: PhosphorIcons.target(),
            onTap: () => _handleGoalTap(context),
          ),
          const Divider(height: AppSpacing.lg),
          MetadataRow(
            label: 'Scheduled For',
            value: scheduledFor != null
                ? '${scheduledFor!.day}/${scheduledFor!.month}/${scheduledFor!.year}'
                : 'Not scheduled',
            icon: PhosphorIcons.calendar(),
            onTap: () => _handleDateTap(context),
          ),
        ],
      ),
    );
  }

  Future<void> _handleDifficultyTap(BuildContext context) async {
    final result = await WorkoutMetadataPickers.showDifficultyPicker(
      context,
      difficulty,
    );
    if (result != null) {
      onDifficultyChanged(result);
    }
  }

  Future<void> _handleGoalTap(BuildContext context) async {
    final result = await WorkoutMetadataPickers.showGoalPicker(context, goal);
    if (result != null) {
      onGoalChanged(result);
    }
  }

  Future<void> _handleDateTap(BuildContext context) async {
    final result = await WorkoutMetadataPickers.showScheduleDatePicker(
      context,
      scheduledFor,
    );
    if (result != null) {
      onScheduledForChanged(result);
    }
  }
}
