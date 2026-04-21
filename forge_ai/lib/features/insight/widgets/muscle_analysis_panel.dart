import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/widgets/exercise_contribution_list.dart';
import 'package:forge_ai/features/insight/widgets/insight_metric_strip.dart';
import 'package:forge_ai/features/insight/widgets/muscle_analysis_chart_card.dart';
import 'package:forge_ai/features/insight/widgets/muscle_exercise_contribution_chart.dart';
import 'package:forge_ai/features/insight/widgets/muscle_load_trend_chart.dart';
import 'package:forge_ai/features/insight/widgets/muscle_recovery_balance_chart.dart';
import 'package:forge_ai/features/insight/widgets/muscle_status_badge.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class MuscleAnalysisPanel extends StatelessWidget {
  const MuscleAnalysisPanel({
    super.key,
    required this.analysis,
    this.onViewAnalysis,
    this.showViewAnalysisButton = true,
  });

  final MuscleAnalysis analysis;
  final VoidCallback? onViewAnalysis;
  final bool showViewAnalysisButton;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      key: const ValueKey('muscle-analysis-panel'),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Expanded(child: _PanelTitle(analysis: analysis)),
              MuscleStatusBadge(status: analysis.status),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          InsightMetricStrip(analysis: analysis),
          const SizedBox(height: AppSpacing.base),
          MuscleAnalysisChartCard(
            title: 'Load trend',
            child: MuscleLoadTrendChart(points: analysis.loadTrend),
          ),
          const SizedBox(height: AppSpacing.base),
          MuscleAnalysisChartCard(
            title: 'Exercise contribution',
            footer: ExerciseContributionList(
              contributions: analysis.exerciseContributions,
            ),
            child: MuscleExerciseContributionChart(
              contributions: analysis.exerciseContributions,
            ),
          ),
          const SizedBox(height: AppSpacing.base),
          MuscleAnalysisChartCard(
            title: 'Recovery balance',
            child: MuscleRecoveryBalanceChart(points: analysis.recoveryBalance),
          ),
          const SizedBox(height: AppSpacing.base),
          _RecommendationCard(text: analysis.recommendation),
          if (showViewAnalysisButton) ...[
            const SizedBox(height: AppSpacing.base),
            AppButton(text: 'View analysis', onPressed: onViewAnalysis),
          ],
        ],
      ),
    );
  }
}

class _PanelTitle extends StatelessWidget {
  const _PanelTitle({required this.analysis});

  final MuscleAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SELECTED MUSCLE', style: AppTypography.labelUppercase),
        const SizedBox(height: AppSpacing.xs),
        Text(analysis.displayName, style: AppTypography.h2),
      ],
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.inputBg,
      hasShadow: false,
      child: Text(text, style: AppTypography.bodySemiBold),
    );
  }
}
