import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';

class MuscleExerciseContributionChart extends StatelessWidget {
  const MuscleExerciseContributionChart({
    super.key,
    required this.contributions,
  });

  final List<ExerciseContribution> contributions;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          for (var index = 0; index < contributions.length; index += 1)
            BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: contributions[index].volume,
                  color: index == 0 ? AppColors.sportOrange : AppColors.aiBlue,
                  width: 18,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
