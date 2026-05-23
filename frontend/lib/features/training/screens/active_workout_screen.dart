import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/training/providers/active_workout_session_provider.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/training/widgets/active_workout_action_bar.dart';
import 'package:forge_ai/features/training/widgets/active_workout_guidance_card.dart';
import 'package:forge_ai/features/training/widgets/active_workout_header.dart';
import 'package:forge_ai/features/training/widgets/active_workout_phase_panel.dart';
import 'package:forge_ai/features/training/widgets/active_workout_progress_card.dart';

class ActiveWorkoutScreen extends ConsumerStatefulWidget {
  const ActiveWorkoutScreen({super.key});

  @override
  ConsumerState<ActiveWorkoutScreen> createState() =>
      _ActiveWorkoutScreenState();
}

class _ActiveWorkoutScreenState extends ConsumerState<ActiveWorkoutScreen> {
  Timer? _ticker;

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(activeWorkoutSessionProvider);
    _syncTicker(session);

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
                      height: MediaQuery.sizeOf(context).height < 700
                          ? 280
                          : 360,
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
                  onSkipPhase: () => ref
                      .read(activeWorkoutSessionProvider.notifier)
                      .skipPhase(),
                  onCompleteRepsExercise: () => ref
                      .read(activeWorkoutSessionProvider.notifier)
                      .completeRepsExercise(),
                  onToggleTimedExercisePause: () => ref
                      .read(activeWorkoutSessionProvider.notifier)
                      .toggleTimedExercisePause(),
                  onFinishSession: () {
                    ref.invalidate(workoutLibraryProvider);
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _syncTicker(ActiveWorkoutSessionState session) {
    if (!session.shouldAutoTick) {
      _ticker?.cancel();
      _ticker = null;
      return;
    }
    if (_ticker != null) return;
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      ref.read(activeWorkoutSessionProvider.notifier).tick();
    });
  }
}
