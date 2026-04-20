import 'package:flutter/material.dart';
import 'package:flutter_body_atlas/flutter_body_atlas.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import '../models/insight_models.dart';

class AnatomyView extends StatelessWidget {
  final List<MuscleData> data;
  const AnatomyView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: FlutterBodyAtlas(
        bodyAtlasController: BodyAtlasController(), // For hit testing if needed
        colorsResolver: (id) {
          final match = data.where((m) => m.id == id).firstOrNull;
          if (match != null) {
            if (match.rpe >= 8) return AppColors.sportOrange;
            if (match.rpe >= 5) return AppColors.energy;
            return AppColors.success;
          }
          return AppColors.inputBg;
        },
      ),
    );
  }
}
