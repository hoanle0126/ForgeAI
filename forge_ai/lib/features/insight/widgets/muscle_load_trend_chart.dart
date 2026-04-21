import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';

class MuscleLoadTrendChart extends StatelessWidget {
  const MuscleLoadTrendChart({super.key, required this.points});

  final List<ChartPoint> points;

  @override
  Widget build(BuildContext context) {
    final spots = [
      for (var index = 0; index < points.length; index += 1)
        FlSpot(index.toDouble(), points[index].value),
    ];

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          drawVerticalLine: false,
          getDrawingHorizontalLine: (_) {
            return const FlLine(color: AppColors.border, strokeWidth: 1);
          },
        ),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: AppColors.aiBlue,
            barWidth: 3,
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.aiBlue.withValues(alpha: 0.16),
            ),
            dotData: const FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}
