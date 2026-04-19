import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DashboardTopHeaderRow extends StatelessWidget {
  const DashboardTopHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: AppSpacing.lg,
          backgroundImage: AssetImage('assets/images/avatar.png'),
          backgroundColor: AppColors.border,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.sportOrangeLight,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              child: Row(
                children: [
                  Text(
                    '12',
                    style: AppTypography.labelUppercase.copyWith(
                      color: AppColors.sportOrange,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    '🔥',
                    style: AppTypography.bodySmall.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.border),
                color: AppColors.cardWhite,
              ),
              child: Icon(
                PhosphorIcons.bell(PhosphorIconsStyle.fill),
                color: AppColors.textDark,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
