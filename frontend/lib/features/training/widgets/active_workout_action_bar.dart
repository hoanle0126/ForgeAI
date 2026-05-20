import 'package:flutter/material.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/providers/active_workout_session_provider.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ActiveWorkoutActionBar extends StatelessWidget {
  const ActiveWorkoutActionBar({
    super.key,
    required this.session,
    required this.onAdvanceTimer,
    required this.onCompleteRepsExercise,
  });

  final ActiveWorkoutSessionState session;
  final VoidCallback onAdvanceTimer;
  final VoidCallback onCompleteRepsExercise;

  @override
  Widget build(BuildContext context) {
    if (session.currentPhase == ActiveWorkoutPhase.complete) {
      return AppButton(
        text: 'Finish Session',
        icon: PhosphorIcons.checkCircle(PhosphorIconsStyle.bold),
        onPressed: () => Navigator.of(context).pop(),
      );
    }

    if (session.currentPhase == ActiveWorkoutPhase.countdown) {
      return AppButton(
        text: session.secondsRemaining <= 1
            ? 'Start Movement'
            : 'Continue Countdown',
        icon: PhosphorIcons.play(PhosphorIconsStyle.fill),
        onPressed: onAdvanceTimer,
      );
    }

    if (session.currentPhase == ActiveWorkoutPhase.rest) {
      return AppButton(
        text: 'Continue Rest',
        icon: PhosphorIcons.timer(PhosphorIconsStyle.bold),
        onPressed: onAdvanceTimer,
      );
    }

    if (session.currentExercise.mode == WorkoutExerciseMode.reps) {
      return AppButton(
        text: 'Complete Target Reps',
        icon: PhosphorIcons.check(PhosphorIconsStyle.bold),
        onPressed: onCompleteRepsExercise,
      );
    }

    return AppButton(
      text: 'Advance Timer',
      icon: PhosphorIcons.lightning(PhosphorIconsStyle.fill),
      onPressed: onAdvanceTimer,
    );
  }
}
