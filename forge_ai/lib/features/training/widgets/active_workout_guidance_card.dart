import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/providers/active_workout_session_provider.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ActiveWorkoutGuidanceCard extends StatelessWidget {
  const ActiveWorkoutGuidanceCard({super.key, required this.session});

  final ActiveWorkoutSessionState session;

  @override
  Widget build(BuildContext context) {
    final cues = _cues;

    return AppCard(
      hasShadow: false,
      padding: const EdgeInsets.all(AppSpacing.base),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('FORM GUIDANCE', style: AppTypography.labelUppercase),
          const SizedBox(height: AppSpacing.md),
          for (final cue in cues) ...[
            _CueRow(text: cue),
            if (cue != cues.last) const SizedBox(height: AppSpacing.md),
          ],
        ],
      ),
    );
  }

  List<String> get _cues {
    return switch (session.currentPhase) {
      ActiveWorkoutPhase.countdown => [
        'Set stance and grip before the timer opens.',
        'Brace first, then move with control.',
        'Use the first rep to confirm range.',
      ],
      ActiveWorkoutPhase.rest => [
        'Bring breathing under control through the nose.',
        'Shake tension out of grip and shoulders.',
        'Preview the next movement before loading.',
      ],
      ActiveWorkoutPhase.complete => [
        'Protocol complete with controlled execution.',
        'Log recovery notes while the signal is fresh.',
        'Hydrate before leaving the session.',
      ],
      ActiveWorkoutPhase.exercise => session.currentExercise.formCues,
    };
  }
}

class _CueRow extends StatelessWidget {
  const _CueRow({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.sportOrangeLight,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Icon(
            PhosphorIcons.crosshair(PhosphorIconsStyle.bold),
            color: AppColors.sportOrange,
            size: 16,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.textDark,
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }
}
