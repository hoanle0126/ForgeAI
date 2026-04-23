import 'package:flutter/material.dart';
import 'package:flutter_body_atlas/flutter_body_atlas.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/widgets/insight_atlas_side_control.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class InsightAnatomyPanel extends StatelessWidget {
  const InsightAnatomyPanel({
    super.key,
    required this.muscleData,
    required this.activeSide,
    required this.onSideChanged,
    required this.onMuscleTap,
    this.fillAvailableHeight = false,
  });

  final List<MuscleData> muscleData;
  final AtlasSide activeSide;
  final ValueChanged<AtlasSide> onSideChanged;
  final ValueChanged<String> onMuscleTap;
  final bool fillAvailableHeight;

  @override
  Widget build(BuildContext context) {
    const resolver = MuscleResolver();

    return AppCard(
      key: const ValueKey('insight-anatomy-panel'),
      padding: const EdgeInsets.all(AppSpacing.base),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text('Muscle map', style: AppTypography.h3)),
              InsightAtlasSideControl(
                activeSide: activeSide,
                onChanged: onSideChanged,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          _AtlasViewport(
            fillAvailableHeight: fillAvailableHeight,
            child: BodyAtlasView<MuscleInfo>(
              view: activeSide == AtlasSide.front
                  ? AtlasAsset.musclesFront
                  : AtlasAsset.musclesBack,
              resolver: resolver,
              colorMapping: _colorMapping(resolver),
              hoverColor: (color) => color.withValues(alpha: 0.72),
              onTapElement: (muscle) => onMuscleTap(muscle.id),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Tap a muscle to inspect training load and recovery.',
            style: AppTypography.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Map<MuscleInfo, Color?> _colorMapping(MuscleResolver resolver) {
    final colorMapping = <MuscleInfo, Color?>{};
    for (final muscle in muscleData) {
      final muscleInfo = resolver.tryById(muscle.id);
      if (muscleInfo != null) {
        colorMapping[muscleInfo] = _colorForStatus(muscle.status);
      }
    }

    return colorMapping;
  }

  Color _colorForStatus(MuscleTrainingStatus status) {
    return switch (status) {
      MuscleTrainingStatus.recovered => AppColors.success,
      MuscleTrainingStatus.moderate => AppColors.energy,
      MuscleTrainingStatus.overloaded => AppColors.sportOrange,
      MuscleTrainingStatus.neutral => AppColors.inputBg,
    };
  }
}

class _AtlasViewport extends StatelessWidget {
  const _AtlasViewport({
    required this.fillAvailableHeight,
    required this.child,
  });

  final bool fillAvailableHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (fillAvailableHeight) {
      return Expanded(child: child);
    }

    return SizedBox(height: AppSpacing.xxxl * 11, child: child);
  }
}
