import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/dashboard/widgets/home/dashboard_stat_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class StatsGridRow extends StatelessWidget {
  const StatsGridRow({
    super.key,
    this.volumeValue = '12.4k',
    this.volumeUnit = 'lbs lifted',
    this.streakDays = 12,
  });

  final String volumeValue;
  final String volumeUnit;
  final int streakDays;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DashboardStatCard(
            title: 'VOLUME',
            value: volumeValue,
            unit: volumeUnit,
            icon: PhosphorIcons.trendUp(PhosphorIconsStyle.bold),
            iconColor: AppColors.success,
          ),
        ),
        const SizedBox(width: AppSpacing.base),
        Expanded(
          child: DashboardStatCard(
            title: 'STREAK',
            value: streakDays.toString(),
            unit: 'days active',
            icon: PhosphorIcons.fire(PhosphorIconsStyle.fill),
            iconColor: AppColors.sportOrange,
          ),
        ),
      ],
    );
  }
}
