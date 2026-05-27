import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/widgets/muscle_load_trend_chart.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:forge_ai/shared/widgets/app_markdown_text.dart';

class InsightCard extends ConsumerWidget {
  final InsightMessage message;
  const InsightCard({super.key, required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(insightNotifierProvider);

    String displayContent = message.content;
    if (displayContent.startsWith('You asked: ')) {
      final index = displayContent.indexOf('". ');
      if (index != -1) {
        displayContent = displayContent.substring(index + 3);
      }
    }

    if (message.isUser) {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16, left: 40),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.sportOrange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            displayContent,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 20),
      child: AppCard(
        color: AppColors.cardWhite.withValues(alpha: 0.9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.smart_toy, color: AppColors.aiBlue, size: 20),
                const SizedBox(width: 8),
                Text('AI Insight', style: AppTypography.labelUppercase),
              ],
            ),
            const SizedBox(height: 12),
            AppMarkdownText(
              text: displayContent,
              style: AppTypography.bodyMedium,
            ),
            if (message.hasChart) ...[
              const SizedBox(height: 16),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.warmIvory,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: stateAsync.maybeWhen(
                  data: (state) {
                    final analysis = state.muscleAnalyses.firstWhere(
                      (a) => a.muscleId == state.selectedMuscleId,
                      orElse: () => state.muscleAnalyses.first,
                    );
                    if (analysis.loadTrend.isEmpty) {
                      return const Center(child: Text('No load trend data'));
                    }
                    final allZero = analysis.loadTrend.every(
                      (p) => p.value == 0,
                    );
                    if (allZero) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                          ),
                          child: Text(
                            'No training volume recorded yet. Log a workout for ${analysis.displayName} to see your trend chart!',
                            textAlign: TextAlign.center,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                      );
                    }
                    return MuscleLoadTrendChart(points: analysis.loadTrend);
                  },
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
