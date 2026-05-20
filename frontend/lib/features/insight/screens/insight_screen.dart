import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/widgets/insight_mobile_layout.dart';
import 'package:forge_ai/features/insight/widgets/insight_wide_layout.dart';

class InsightScreen extends ConsumerWidget {
  const InsightScreen({super.key});

  static const double _wideBreakpoint = 720;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: stateAsync.when(
          data: (state) {
            final selectedAnalysis = _analysisFor(
              state,
              state.selectedMuscleId,
            );

            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= _wideBreakpoint) {
                  return InsightWideLayout(
                    state: state,
                    selectedAnalysis: selectedAnalysis,
                  );
                }

                return InsightMobileLayout(
                  state: state,
                  selectedAnalysis: selectedAnalysis,
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text(
              'Unable to load insights.',
              style: AppTypography.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }

  MuscleAnalysis _analysisFor(InsightState state, String id) {
    for (final analysis in state.muscleAnalyses) {
      if (analysis.muscleId == id) return analysis;
    }

    return MuscleAnalysis(
      muscleId: id,
      displayName: 'Unknown muscle',
      status: MuscleTrainingStatus.neutral,
      volume: 0,
      rpe: 0,
      trendPercent: 0,
      fatigueScore: 0,
      recommendation: 'No analysis is available for this muscle yet.',
    );
  }
}
