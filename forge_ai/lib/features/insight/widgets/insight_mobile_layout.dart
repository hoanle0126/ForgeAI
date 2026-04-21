import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/widgets/insight_anatomy_panel.dart';
import 'package:forge_ai/features/insight/widgets/insight_header.dart';
import 'package:forge_ai/features/insight/widgets/insight_metric_strip.dart';
import 'package:forge_ai/features/insight/widgets/muscle_preview_sheet.dart';
import 'package:go_router/go_router.dart';

class InsightMobileLayout extends ConsumerWidget {
  const InsightMobileLayout({
    super.key,
    required this.state,
    required this.selectedAnalysis,
  });

  final InsightState state;
  final MuscleAnalysis selectedAnalysis;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      key: const ValueKey('insight-mobile-layout'),
      padding: AppSpacing.screenPadding.copyWith(
        top: AppSpacing.base,
        bottom: AppSpacing.xl,
      ),
      children: [
        InsightHeader(onChatPressed: () => context.go(AppRoutes.insightChat)),
        const SizedBox(height: AppSpacing.base),
        InsightAnatomyPanel(
          muscleData: state.muscleData,
          activeSide: state.activeAtlasSide,
          onSideChanged: (side) {
            ref.read(insightNotifierProvider.notifier).setAtlasSide(side);
          },
          onMuscleTap: (id) {
            ref.read(insightNotifierProvider.notifier).selectMuscle(id);
            MusclePreviewSheet.show(context, id);
          },
        ),
        const SizedBox(height: AppSpacing.base),
        InsightMetricStrip(analysis: selectedAnalysis),
      ],
    );
  }
}
