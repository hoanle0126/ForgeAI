import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/dashboard/widgets/dashboard_stat_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class StatsGridRow extends StatelessWidget {
  const StatsGridRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DashboardStatCard(
            title: 'VOLUME',
            value: '12.4k',
            unit: 'lbs lifted',
            icon: PhosphorIcons.trendUp(PhosphorIconsStyle.bold),
            iconColor: AppColors.success,
          ),
        ),
        const SizedBox(width: AppSpacing.base),
        Expanded(
          child: DashboardStatCard(
            title: 'STREAK',
            value: '12',
            unit: 'days active',
            icon: PhosphorIcons.fire(PhosphorIconsStyle.fill),
            iconColor: AppColors.sportOrange,
          ),
        ),
      ],
    );
  }
}
