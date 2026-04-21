import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/widgets/muscle_analysis_panel.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MuscleDetailScreen extends ConsumerWidget {
  const MuscleDetailScreen({super.key, required this.muscleId});

  final String muscleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: stateAsync.when(
          data: (state) {
            return ListView(
              padding: AppSpacing.screenPadding.copyWith(
                top: AppSpacing.base,
                bottom: AppSpacing.xl,
              ),
              children: [
                _DetailHeader(onBack: () => context.pop()),
                const SizedBox(height: AppSpacing.base),
                MuscleAnalysisPanel(
                  analysis: _analysisFor(state, muscleId),
                  showViewAnalysisButton: false,
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text(
              'Unable to load analysis.',
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

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: 'Back',
          onPressed: onBack,
          icon: Icon(PhosphorIcons.arrowLeft()),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: Text('Muscle analysis', style: AppTypography.h2)),
      ],
    );
  }
}
