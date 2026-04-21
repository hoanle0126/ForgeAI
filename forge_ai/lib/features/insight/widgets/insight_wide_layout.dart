import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/widgets/insight_anatomy_panel.dart';
import 'package:forge_ai/features/insight/widgets/insight_header.dart';
import 'package:forge_ai/features/insight/widgets/muscle_analysis_panel.dart';
import 'package:go_router/go_router.dart';

class InsightWideLayout extends ConsumerWidget {
  const InsightWideLayout({
    super.key,
    required this.state,
    required this.selectedAnalysis,
  });

  final InsightState state;
  final MuscleAnalysis selectedAnalysis;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      key: const ValueKey('insight-wide-layout'),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 6, child: _AtlasColumn(state: state)),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            flex: 4,
            child: MuscleAnalysisPanel(
              analysis: selectedAnalysis,
              onViewAnalysis: () {
                context.go(
                  AppRoutes.insightMuscleDetail(selectedAnalysis.muscleId),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AtlasColumn extends ConsumerWidget {
  const _AtlasColumn({required this.state});

  final InsightState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        InsightHeader(
          onChatPressed: () {
            ref.read(insightNotifierProvider.notifier).setChatPanelOpen(true);
          },
        ),
        const SizedBox(height: AppSpacing.base),
        Expanded(
          child: InsightAnatomyPanel(
            muscleData: state.muscleData,
            activeSide: state.activeAtlasSide,
            fillAvailableHeight: true,
            onSideChanged: (side) {
              ref.read(insightNotifierProvider.notifier).setAtlasSide(side);
            },
            onMuscleTap: (id) {
              ref.read(insightNotifierProvider.notifier).selectMuscle(id);
            },
          ),
        ),
      ],
    );
  }
}
