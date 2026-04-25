import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/training/providers/active_workout_session_provider.dart';
import 'package:forge_ai/features/training/widgets/active_workout_action_bar.dart';
import 'package:forge_ai/features/training/widgets/active_workout_guidance_card.dart';
import 'package:forge_ai/features/training/widgets/active_workout_header.dart';
import 'package:forge_ai/features/training/widgets/active_workout_phase_panel.dart';
import 'package:forge_ai/features/training/widgets/active_workout_progress_card.dart';

class ActiveWorkoutScreen extends ConsumerWidget {
  const ActiveWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(activeWorkoutSessionProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppSpacing.screenPadding.add(
                const EdgeInsets.only(top: AppSpacing.base),
              ),
              child: ActiveWorkoutHeader(
                title: session.plan.title,
                onClose: () => Navigator.of(context).pop(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: AppSpacing.screenPadding.add(
                  const EdgeInsets.only(
                    top: AppSpacing.base,
                    bottom: AppSpacing.xxl,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: _phasePanelHeight(context),
                      child: ActiveWorkoutPhasePanel(session: session),
                    ),
                    const SizedBox(height: AppSpacing.base),
                    ActiveWorkoutGuidanceCard(session: session),
                    const SizedBox(height: AppSpacing.base),
                    ActiveWorkoutProgressCard(session: session),
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: AppSpacing.screenPadding.add(
                  const EdgeInsets.only(
                    top: AppSpacing.sm,
                    bottom: AppSpacing.base,
                  ),
                ),
                child: ActiveWorkoutActionBar(
                  session: session,
                  onAdvanceTimer: () =>
                      ref.read(activeWorkoutSessionProvider.notifier).tick(),
                  onCompleteRepsExercise: () => ref
                      .read(activeWorkoutSessionProvider.notifier)
                      .completeRepsExercise(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _phasePanelHeight(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    if (height < 700) return 280;
    return 360;
  }
}
