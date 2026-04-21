import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/widgets/insight_metric_strip.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class MusclePreviewSheet extends ConsumerWidget {
  const MusclePreviewSheet({super.key, required this.muscleId});

  final String muscleId;

  static Future<void> show(BuildContext context, String muscleId) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.transparent,
      isScrollControlled: true,
      builder: (context) => MusclePreviewSheet(muscleId: muscleId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(insightNotifierProvider);

    return stateAsync.when(
      data: (state) => _PreviewContent(analysis: _analysisFor(state, muscleId)),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => const SizedBox.shrink(),
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

class _PreviewContent extends StatelessWidget {
  const _PreviewContent({required this.analysis});

  final MuscleAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.base),
      decoration: const BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(analysis.displayName, style: AppTypography.h2),
            const SizedBox(height: AppSpacing.sm),
            Text(analysis.recommendation, style: AppTypography.bodyMedium),
            const SizedBox(height: AppSpacing.base),
            InsightMetricStrip(analysis: analysis),
            const SizedBox(height: AppSpacing.base),
            AppButton(
              text: 'View analysis',
              onPressed: () {
                Navigator.of(context).pop();
                context.go(AppRoutes.insightMuscleDetail(analysis.muscleId));
              },
            ),
          ],
        ),
      ),
    );
  }
}
