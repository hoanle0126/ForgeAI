import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class NotificationCenterHeader extends StatelessWidget {
  const NotificationCenterHeader({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Semantics(
            button: true,
            label: 'Back to dashboard',
            child: Material(
              color: AppColors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onBack,
                child: Container(
                  width: AppSpacing.xxxl,
                  height: AppSpacing.xxxl,
                  decoration: BoxDecoration(
                    color: AppColors.cardWhite,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.textDark,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.base),
        Text('NOTIFICATIONS', style: AppTypography.labelUppercase),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Notification Center',
          style: AppTypography.h1.copyWith(color: AppColors.textDark),
        ),
        const SizedBox(height: AppSpacing.base),
        Text(
          'Training, recovery, and AI plan signals in one place.',
          style: AppTypography.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
