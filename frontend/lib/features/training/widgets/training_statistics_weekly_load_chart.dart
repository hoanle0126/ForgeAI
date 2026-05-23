import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/training_statistics_models.dart';

class TrainingStatisticsWeeklyLoadChart extends StatelessWidget {
  const TrainingStatisticsWeeklyLoadChart({super.key, required this.points});

  final List<TrainingStatisticsPoint> points;

  @override
  Widget build(BuildContext context) {
    final maxValue = points.fold<double>(
      0,
      (max, point) => point.value > max ? point.value : max,
    );
    final chartMax = maxValue == 0 ? 40.0 : (maxValue * 1.25).ceilToDouble();

    return BarChart(
      BarChartData(
        maxY: chartMax,
        alignment: BarChartAlignment.spaceAround,
        gridData: FlGridData(
          drawVerticalLine: false,
          getDrawingHorizontalLine: (_) {
            return const FlLine(color: AppColors.border, strokeWidth: 1);
          },
        ),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: AppSpacing.lg,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                final label = index >= 0 && index < points.length
                    ? points[index].label
                    : '';
                return Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm),
                  child: Text(label, style: AppTypography.label),
                );
              },
            ),
          ),
        ),
        barTouchData: const BarTouchData(enabled: false),
        barGroups: [
          for (final point in points.indexed)
            BarChartGroupData(
              x: point.$1,
              barRods: [
                BarChartRodData(
                  toY: point.$2.value,
                  color: AppColors.sportOrange,
                  width: AppSpacing.base,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: chartMax,
                    color: AppColors.inputBg,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
