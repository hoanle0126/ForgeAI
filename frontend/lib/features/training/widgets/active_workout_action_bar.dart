import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/providers/active_workout_session_provider.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ActiveWorkoutActionBar extends StatelessWidget {
  const ActiveWorkoutActionBar({
    super.key,
    required this.session,
    required this.onSkipPhase,
    required this.onCompleteRepsExercise,
    required this.onToggleTimedExercisePause,
    required this.onFinishSession,
  });

  final ActiveWorkoutSessionState session;
  final VoidCallback onSkipPhase;
  final VoidCallback onCompleteRepsExercise;
  final VoidCallback onToggleTimedExercisePause;
  final VoidCallback onFinishSession;

  @override
  Widget build(BuildContext context) {
    if (session.currentPhase == ActiveWorkoutPhase.complete) {
      return const SizedBox.shrink();
    }

    if (session.currentPhase == ActiveWorkoutPhase.countdown) {
      return AppButton(
        text: 'Skip Countdown',
        icon: PhosphorIcons.skipForward(PhosphorIconsStyle.bold),
        onPressed: onSkipPhase,
      );
    }

    if (session.currentPhase == ActiveWorkoutPhase.rest) {
      return AppButton(
        text: 'Skip Rest',
        icon: PhosphorIcons.skipForward(PhosphorIconsStyle.bold),
        onPressed: onSkipPhase,
      );
    }

    if (session.currentExercise.mode == WorkoutExerciseMode.reps) {
      return AppButton(
        text: 'Complete Target Reps',
        icon: PhosphorIcons.check(PhosphorIconsStyle.bold),
        onPressed: onCompleteRepsExercise,
      );
    }

    return Row(
      children: [
        Expanded(
          child: AppButton(
            text: 'Skip',
            variant: AppButtonVariant.secondary,
            icon: PhosphorIcons.skipForward(PhosphorIconsStyle.bold),
            onPressed: onSkipPhase,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: AppButton(
            text: session.isTimerPaused ? 'Resume Timer' : 'Pause Timer',
            icon: session.isTimerPaused
                ? PhosphorIcons.play(PhosphorIconsStyle.fill)
                : PhosphorIcons.pause(PhosphorIconsStyle.fill),
            onPressed: onToggleTimedExercisePause,
          ),
        ),
      ],
    );
  }
}
