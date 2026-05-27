import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_metric_tile.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AccountMetricRow extends StatelessWidget {
  const AccountMetricRow({
    super.key,
    required this.streakValue,
    required this.readinessValue,
    required this.loadValue,
  });

  final String streakValue;
  final String readinessValue;
  final String loadValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AccountMetricTile(
          label: 'STREAK',
          value: streakValue,
          icon: PhosphorIcons.fire(PhosphorIconsStyle.fill),
          backgroundColor: AppColors.sportOrangeLight,
          labelColor: AppColors.sportOrange,
        ),
        const SizedBox(width: AppSpacing.sm),
        AccountMetricTile(
          label: 'READY',
          value: readinessValue,
          icon: PhosphorIcons.heartbeat(PhosphorIconsStyle.fill),
          backgroundColor: AppColors.inputBg,
        ),
        const SizedBox(width: AppSpacing.sm),
        AccountMetricTile(
          label: 'LOAD',
          value: loadValue,
          icon: PhosphorIcons.barbell(PhosphorIconsStyle.fill),
          backgroundColor: AppColors.recoveryLight,
          labelColor: AppColors.recovery,
        ),
      ],
    );
  }
}
