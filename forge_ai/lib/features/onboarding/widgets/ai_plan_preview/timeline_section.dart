import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/onboarding/widgets/ai_plan_preview/timeline_phase.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TimelinePhase(
          phase: 'PHASE 1',
          title: 'Foundation',
          subtitle: 'Building base',
          description:
              'Neural adaptation and metabolic priming for the work ahead.',
          color: AppColors.sportOrange,
          isFirst: true,
        ),
        TimelinePhase(
          phase: 'PHASE 2',
          title: 'Build',
          subtitle: 'Progressive overload',
          description:
              'Increasing intensity and volume to trigger significant body recomposition.',
          color: AppColors.aiBlue,
        ),
        TimelinePhase(
          phase: 'PHASE 3',
          title: 'Peak',
          subtitle: 'Max performance',
          description:
              'Refining muscle definition and maximizing anaerobic capacity for elite finish.',
          color: AppColors.success,
          isLast: true,
        ),
      ],
    );
  }
}
