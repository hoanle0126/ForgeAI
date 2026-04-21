import 'package:flutter/material.dart';
import 'package:flutter_body_atlas/flutter_body_atlas.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';

class AnatomyView extends StatelessWidget {
  final List<MuscleData> data;
  const AnatomyView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    const resolver = MuscleResolver();

    final Map<MuscleInfo, Color> colorMapping = {};

    for (final muscle in data) {
      final muscleInfo = resolver.tryById(muscle.id);
      if (muscleInfo != null) {
        Color color = AppColors.success;
        if (muscle.rpe >= 8) {
          color = AppColors.sportOrange;
        } else if (muscle.rpe >= 5) {
          color = AppColors.energy;
        }

        colorMapping[muscleInfo] = color;
      }
    }

    return SizedBox(
      height: 400,
      child: Row(
        children: [
          Expanded(
            child: BodyAtlasView<MuscleInfo>(
              view: AtlasAsset.musclesFront,
              resolver: resolver,
              colorMapping: colorMapping,
            ),
          ),
          Expanded(
            child: BodyAtlasView<MuscleInfo>(
              view: AtlasAsset.musclesBack,
              resolver: resolver,
              colorMapping: colorMapping,
            ),
          ),
        ],
      ),
    );
  }
}
