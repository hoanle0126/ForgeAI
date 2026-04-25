import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/providers/active_workout_session_provider.dart';

class ActiveWorkoutPhasePanel extends StatelessWidget {
  const ActiveWorkoutPhasePanel({super.key, required this.session});

  final ActiveWorkoutSessionState session;

  @override
  Widget build(BuildContext context) {
    final isComplete = session.currentPhase == ActiveWorkoutPhase.complete;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
                child: Text(
                  session.phaseLabel.toUpperCase(),
                  style: AppTypography.labelUppercase.copyWith(
                    color: AppColors.cardWhite,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                session.exercisePositionLabel,
                style: AppTypography.statSmall.copyWith(
                  color: AppColors.cardWhite.withValues(alpha: 0.70),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            _title(isComplete),
            style: AppTypography.h1.copyWith(
              color: AppColors.cardWhite,
              height: 1.05,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            _subtitle(isComplete),
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.72),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                isComplete ? '100%' : session.timerLabel,
                style: AppTypography.statLarge.copyWith(
                  color: AppColors.sportOrange,
                  fontSize: 48,
                  height: 1,
                ),
              ),
              const SizedBox(width: AppSpacing.base),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                  child: Text(
                    isComplete
                        ? 'SYNCED'
                        : session.currentExercise.targetLabel.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.labelUppercase.copyWith(
                      color: AppColors.cardWhite.withValues(alpha: 0.78),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _title(bool isComplete) {
    if (isComplete) return 'Session complete';
    if (session.currentPhase == ActiveWorkoutPhase.countdown) return 'Lock in';
    if (session.currentPhase == ActiveWorkoutPhase.rest) {
      return 'Recover with intent';
    }
    return session.currentExercise.name;
  }

  String _subtitle(bool isComplete) {
    if (isComplete) {
      return 'ForgeAI logged the protocol and preserved clean volume.';
    }
    if (session.currentPhase == ActiveWorkoutPhase.rest) {
      return 'Next movement: ${session.nextExercise?.name ?? 'finish protocol'}.';
    }
    return '${session.currentExercise.muscleLabel} • ${session.currentExercise.equipmentLabel}';
  }
}
