import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class AccountMetricTile extends StatelessWidget {
  const AccountMetricTile({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.backgroundColor,
    this.labelColor = AppColors.textDisabled,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color backgroundColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Semantics(
        label: '$label $value',
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.xs),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite.withValues(alpha: 0.64),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: Icon(icon, color: labelColor, size: 16),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(value, style: AppTypography.statLarge),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.labelUppercase.copyWith(color: labelColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
